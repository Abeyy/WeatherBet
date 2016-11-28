class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable

	has_many :reports, dependent: :destroy
	has_many :predictions, dependent: :destroy

	def weight 
	  require "#{Rails.root}/Cstuff/rice_test"

	  @usrStats = WbStat.new 
	  @usrStats.correct=0

	  @predictions = self.predictions
	  @usrStats.total = @predictions.count

	  @predictions.each do |p|
	  	  Prediction.check(p)
	      if p.report_id
	        @usrStats.correct += 1
	      end #p.report_id

	  end #end predictions.each do |p|

	  return @usrStats.laplace
	end
end