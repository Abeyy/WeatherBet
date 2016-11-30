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

	def self.getCoords(place)
		return (HTTParty.get('https://maps.googleapis.com/maps/api/geocode/json?', query: {address: place}).parsed_response.first[1].first)["geometry"]["location"]
	end

	def self.distance(lat1, lng1, lat2, lng2) 
		require "#{Rails.root}/Cstuff/rice_test"
		return RiceTest.new.distanceEarth(lat1, lng1, lat2, lng2)
	end

	def self.getMapFrame(lat, lng, zoom)
		return "<iframe src="+getMapURI(lat, lng, zoom)+"</iframe>"
	end
	def self.getMapURI(lat, lng, zoom)
		return "http://maps.google.com/maps?q="+
			lat.to_s+","+lng.to_s+"&z="+zoom.to_s+"&output=embed"
	end
end
