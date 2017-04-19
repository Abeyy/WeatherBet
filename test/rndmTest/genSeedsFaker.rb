require 'faker'

NUM_LOCATIONS = 20
NUM_USERS = 10
NUM_PREDICTIONS = 1500
NUM_REPORTS = 1500


def createPrediction(time)
	# print "\t{start: #{time}, end: #{time+Faker::Number.between(3600, 7*3600)}, location_id: #{Faker::Number.between(1, NUM_LOCATIONS)}, user_id: #{Faker::Number.between(1, NUM_USERS)}}"
	print "\t{start: DateTime.new(#{time.year}, #{time.month}, #{time.day}, #{time.hour}), end: DateTime.new(#{time.year}, #{time.month}, #{time.day}, #{time.hour+Faker::Number.between(1,7)}), location_id: #{Faker::Number.between(1, NUM_LOCATIONS)}, user_id: #{Faker::Number.between(1, NUM_USERS)}}"
end

def createReport(time)
	# print "\t{start: #{time}, end: #{time+Faker::Number.between(3600, 7*3600)}, location_id: #{Faker::Number.between(1, NUM_LOCATIONS)}, user_id: #{Faker::Number.between(1, NUM_USERS)}}"
	print "\t{start: DateTime.new(#{time.year}, #{time.month}, #{time.day}, #{time.hour}), end: DateTime.new(#{time.year}, #{time.month}, #{time.day}, #{time.hour+Faker::Number.between(1,7)}), location_id: #{Faker::Number.between(1, NUM_LOCATIONS)}, user_id: #{Faker::Number.between(1, NUM_USERS)}}"
end

def createUser(email=Faker::Internet.email, password="\"password\"", password_confirmation="\"password\"")
	print "\t{email: \"#{email}\", password: #{password}, password_confirmation: #{password_confirmation}}"
end

def createLocation
	i = Faker::Number.between(0, 2)
	loc = [Faker::GameOfThrones.city, Faker::Pokemon.location, Faker::StarWars.planet][i]
	print "\t{name: \"#{loc}\"}"
end

def createTime(rangeStart, rangeEnd)
	return Faker::Time.between(DateTime.now-rangeStart, DateTime.now-rangeEnd, :day)
end


puts "predictions = Prediction.create(["
(0...NUM_PREDICTIONS).each do |n|
	createPrediction(createTime(120, 60))
	puts ","
end
createPrediction(createTime(120, 60))
puts "\n\t])\n"


puts "reports = Report.create(["
(1...NUM_REPORTS).each do |n|
	createReport(createTime(120, 60))
	puts ","
end
createReport(createTime(120, 60))
puts "\n\t])\n"


puts "users = User.create(["
(1...NUM_USERS).each do |n|
	createUser
	puts ","
end
createUser("b@b")
puts "\n\t])\n"

puts "locations = Location.create(["
(1...NUM_LOCATIONS).each do |n|
	createLocation
	puts ","
end
createLocation
puts "\n\t])\n"









