class Prediction < ApplicationRecord
  belongs_to :location
  belongs_to :user
  attr_accessor

  def getConfirmingReports
  	return Report.where(location: location, start: DateTime.new(1971)..self.end, end: start..DateTime.now)
  end #end getConfirmingReports

  def check
  	return getConfirmingReports.any?
  end
end
