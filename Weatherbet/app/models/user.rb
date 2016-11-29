class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reports, dependent: :destroy
  has_many :predictions, dependent: :destroy

  def predictionsToConsider
	  return predictions.where(start: DateTime.new(1971)..DateTime.now.days_ago(1))
  end #predictionsToConsider

  def totalPredictions
  	predictionsToConsider.count
  end

  def correctPredictions
  	correct = 0
  	predictionsToConsider.find_each do |p|
  		if p.check; correct += 1 end
  	end #end predictions_to_consider find 
  	return correct
  end

  def getWeight
    if self.weight
      return self.weight
    else
      w = (correctPredictions+1.0)/(totalPredictions+2.0)
      self.weight = w
      self.save!
  	  return -w
    end
  end #weight 
end
