class Location < ApplicationRecord
	has_many :predictions
	has_many :reports

	def getProbability(dateTime)
		# correct = 0.0
		# total = 0.0
		score = 0.0

		Prediction.where(start: (dateTime.beginning_of_day()..dateTime.end_of_day())).find_each do |p|
			# total += 1
			# if p.check
				# correct += 1
			# end
			score += p.user.weight
		end
		
		# return (correct+1.0)/(total+2.0)
		return score
	end
end
