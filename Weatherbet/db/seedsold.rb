# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

locations = Location.create([
	{name: 'Ellenville'}, 
	{name: 'Mt. Brace'}, 
	{name: 'Little Gap/Blue Mt.'}, 
	{name: 'Rocky Point'}
	])


predictions = Prediction.create([
	{start: (DateTime.new(2016, 5, 12, 8)), end: DateTime.new(2016, 5, 12, 15), location_id: 1},
	{start: (DateTime.new(2016, 5, 13, 9)), end: DateTime.new(2016, 5, 12, 15), location_id: 1},
	{start: (DateTime.new(2016, 5, 14, 10)), end: DateTime.new(2016, 5, 12, 15), location_id: 1},
	{start: (DateTime.new(2016, 5, 15, 9, 30)), end: DateTime.new(2016, 5, 12, 15), location_id: 1}
	])

reports = Report.create([
	{start: (DateTime.new(2016, 5, 12, 9)), end: DateTime.new(2016, 5, 12, 16), location_id: 1},
	{start: (DateTime.new(2016, 5, 13, 9)), end: DateTime.new(2016, 5, 13, 15), location_id: 1},
	{start: (DateTime.new(2016, 5, 13, 9)), end: DateTime.new(2016, 5, 13, 14), location_id: 2},
	{start: (DateTime.new(2016, 5, 14, 9)), end: DateTime.new(2016, 5, 14, 18), location_id: 1},
	{start: (DateTime.new(2016, 5, 14, 9)), end: DateTime.new(2016, 5, 14, 15), location_id: 2},
	{start: (DateTime.new(2016, 5, 14, 9)), end: DateTime.new(2016, 5, 14, 16), location_id: 1},
	{start: (DateTime.new(2016, 5, 15, 9)), end: DateTime.new(2016, 5, 15, 12), location_id: 1}
	])