class Location < ApplicationRecord
	has_many :predictions
	has_many :reports

	def getScore(dateTime)
		# correct = 0.0
		# total = 0.0
		score = 0.0

		predictions.where(start: (dateTime.beginning_of_day()..dateTime.end_of_day())).find_each do |p|
			# total += 1
			# if p.check
				# correct += 1
			# end
			score += p.user.getWeight
		end
		
		# return (correct+1.0)/(total+2.0)
		return score
	end

	def getAvgPredictingWeight(dateTime)
		score = 0.0
		n = 0.0
		predictions.where(start: (dateTime.beginning_of_day()..dateTime.end_of_day())).find_each do |p|
			n += 1.0
			score = score + p.user.getWeight
		end
		return score / n
	end

	def getCondProb(dateTime)
		score = 1.0
		predictions.where(start: (dateTime.beginning_of_day()..dateTime.end_of_day())).find_each do |p|
			score = score * p.user.getWeight
		end
		return score
	end
	def getCondProbN(dateTime)
		score = 1.0
		n = 0.0
		predictions.where(start: (dateTime.beginning_of_day()..dateTime.end_of_day())).find_each do |p|
			n += 1
			score = score * p.user.getWeight
		end
		return score*n
	end
	def getCondProbN2(dateTime)
		score = 1.0
		n = 0.0
		predictions.where(start: (dateTime.beginning_of_day()..dateTime.end_of_day())).find_each do |p|
			n += 1
			score = score * p.user.getWeight
		end
		return score*n*n
	end
	def getAPWn(dateTime)
		score = 0
		n = 0.0
		predictions.where(start: (dateTime.beginning_of_day()..dateTime.end_of_day())).find_each do |p|
			n += 1.0
			score = score + p.user.getWeight
		end

		return n==0?0:(score/n)+(n/20.0)
	end

	#break this out into Weather model
	def getWeatherHash() 
		#store this in the database
		return HTTParty.get('http://winds-aloft.mohawkapps.com/').parsed_response
	end
	#break this out into Weather model
	def getStationHash()
		#store this in the database
		return HTTParty.get('http://winds-aloft.mohawkapps.com/stations').parsed_response
	end
	def self.getNearestStation(place, stations) 
		# if lat? 0/0
		return stations.sort_by { |s| Location.distance(place.lat, place.lng, s["lat"], s["lon"]) }.first
	end
	def self.getWeatherAtStation(station, weather)
		return weather["winds"][ station["code"] ]
	end

	def self.surfaceWeather(lat, lng) 
		query = "select * from weather.forecast where woeid in (SELECT woeid FROM geo.places WHERE text='(#{lat},#{lng})')"
		return HTTParty.get('https://query.yahooapis.com/v1/public/yql?', query: {q: query}).parsed_response["query"]["results"]
	end

	def self.getCoords(place)
		return (HTTParty.get('https://maps.googleapis.com/maps/api/geocode/json?', query: {address: place}).parsed_response.first[1].first)["geometry"]["location"]
	end

	def self.distance(lat1, lng1, lat2, lng2) 
		require "#{Rails.root}/Cstuff/rice_test"
		return RiceTest.new.distanceEarth(lat1, lng1, lat2, lng2)
	end

	# def distance(lat1, lng1) 
	# 	require "#{Rails.root}/Cstuff/rice_test"
	# 	return RiceTest.new.distanceEarth(lat, lng, lat2, lng2)
	# end

	def self.getMapFrame(lat, lng, zoom)
		return "<iframe src="+getMapURI(lat, lng, zoom)+"</iframe>"
	end

	def self.getMapURI(lat, lng, zoom)
		return "http://maps.google.com/maps?q="+
			lat.to_s+","+lng.to_s+"&z="+zoom.to_s+"&output=embed"
	end
end
