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
		return score/n+n/20.0
	end
end
