require 'faker'

NUM_LOCATIONS = 20
NUM_USERS = 10
NUM_PREDICTIONS = 500
NUM_REPORTS = 750


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
	createPrediction(createTime(60, -5))
	puts ","
end
createPrediction(createTime(60, -5))
puts "\n\t])\n"


puts "reports = Report.create(["
(1...NUM_REPORTS).each do |n|
	createReport(createTime(60, 1))
	puts ","
end
createReport(createTime(60, 1))
puts "\n\t])\n"










