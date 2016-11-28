class UsersController < ApplicationController
  def show
  	createUsrStats
  end

  def createUsrStats 
    require "#{Rails.root}/Cstuff/rice_test"
    @user = current_user
    if user_signed_in?    
      @usrStats = WbStat.new 
      @usrStats.correct=0

      @predictions = @user.predictions
      @usrStats.total = @predictions.count

      @predictions.each do |p|
        unless p.report_id; break end
       
        Prediction.check(p)
        # Report.where(location: p.location).each do |r|
        #   sINr =(r.start < p.start and p.start < r.end)
        #   eINr =(r.start < p.end and p.start < r.end)

        #   thisReportConfirmsPrediction = sINr or eINr
          
        #   if thisReportConfirmsPrediction
        #     p.report_id = r.id
        #     p.save
        #     break 
        #   end

        # end #end Report.wher... do |r|

        if p.report_id
          @usrStats.correct += 1
        end #end isTrue

      end #end predictions.each do |p|

      # save the user

    end #end if user_signed_in
  end

end
