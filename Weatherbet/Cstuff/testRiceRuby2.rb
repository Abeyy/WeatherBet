require "/Users/_-_/Documents/Poly/Poly Fall 2016/Software EG/Weatherbet/untitled folder/WeatherBet-Rails-/Weatherbet/Cstuff/rice_test"
require 'httparty'

blah = RiceTest.new

k =  HTTParty.get('https://maps.googleapis.com/maps/api/geocode/json?&address=nyc')
# puts k.body["results"]["geometry"]

k.parsed_response.each do |item|
	item.each do |sub|
		puts sub
		puts ""
	end

end



puts blah.distanceEarth(40.66, 34.12, 40.88, 34.24)

puts ""

puts k.parsed_response.first[1]

puts "blah"
puts ""

k.parsed_response.first[1].each do |p|
	p.each do |q|
		puts q
		puts ""
	end
	puts ""
end

puts ""
q = (k.parsed_response.first[1].first)
print "MySpot: "
puts q

puts ""
puts ""

puts (q["geometry"])["location"]

puts (k.parsed_response.first[1].first)["geometry"]["location"]

def getCoords(place)
	return (HTTParty.get('https://maps.googleapis.com/maps/api/geocode/json?', query: {address: place}).parsed_response.first[1].first)["geometry"]["location"]
end

puts "in a func:"
puts getCoords("NYC")
puts getCoords("brooklyn")
puts getCoords("brooklyn")["lat"]
puts getCoords("brooklyn")["lng"]
puts ""

coords = getCoords("nyc")
puts coords["lat"]*2
puts coords["lng"]*2





