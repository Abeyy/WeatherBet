class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reports, dependent: :destroy
  has_many :predictions, dependent: :destroy

	# class << self
		def weight 
			require "#{Rails.root}/Cstuff/rice_test"
	   

	      @usrStats = WbStat.new 
	      @usrStats.correct=0

	      @predictions = self.predictions
	      @usrStats.total = @predictions.count

	      @predictions.each do |p|
	        #should really not have to check every prediction every time. Once it is checked once, just save the value for later.         
	        class << p
	          attr_accessor :isTrue
	        end
	        # isTrue = false

	        Report.where(location: p.location).each do |r|
	          sINr =(r.start < p.start and p.start < r.end)
	          eINr =(r.start < p.end and p.start < r.end)

	          thisReportConfirmsPrediction = sINr or eINr
	          p.isTrue = (p.isTrue or thisReportConfirmsPrediction)

	          if thisReportConfirmsPrediction
	            class << p
	              attr_accessor :confirmingReport
	            end
	            p.confirmingReport = r
	            #once p is verified, why keep looping?

	          end #end if thisReportConfirmsPrediction

	        end #end Report.wher... do |r|

	        if p.isTrue 
	          @usrStats.correct += 1
	        end #end isTrue

	      end #end predictions.each do |p|

	      return @usrStats.laplace

	  end
	# end
end