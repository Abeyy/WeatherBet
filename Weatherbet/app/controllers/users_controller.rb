class UsersController < ApplicationController
  def show
  	require "#{Rails.root}/Cstuff/rice_test"
    @user = current_user
    if user_signed_in?    

      @usrStats = WbStat.new 
      @usrStats.correct=0

      @predictions = @user.predictions
      @usrStats.total = @predictions.count

      @predictions.each do |p|
      	
      	class << p
      		attr_accessor :isTrue
      	end
        # isTrue = false

        Report.where(location: p.location).each do |r|
          sINr =(r.start < p.start and p.start < r.end)
          eINr =(r.start < p.end and p.start < r.end)
          p.isTrue = (p.isTrue or sINr or eINr)
        end #end Report.wher... do |r|

        if p.isTrue 
          @usrStats.correct += 1
        end #end isTrue

      end #end predictions.each do |p|

    end #end if user_signed_in
  end
end
