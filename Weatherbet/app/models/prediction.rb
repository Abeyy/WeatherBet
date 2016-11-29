class Prediction < ApplicationRecord
  belongs_to :location
  belongs_to :user
  attr_accessor

  def getReleventReports
  	# @relevent = Report.where(location: p.location, start: (p.start-1)..(p.end+1))
  	# @relevent = Report.where(location: location, start: (start.days_ago(2))..start.days_ago(-2))
  	return Report.where(location: location, start: DateTime.new(1971)..self.end, end: start..DateTime.now)

  	# return @relevent
  end #end check

  def check
  	return getReleventReports.any?
  end
end
