class PagesController < ApplicationController
  def home
  end

  def weather
  	# require "#{Rails.root}/Cstuff/rice_test"

   #  @user = current_user
   #  if user_signed_in?    
   #    @usrStats = WbStat.new 
   #    @usrStats.correct=0

   #    @predictions = @user.predictions
   #    @usrStats.total = @predictions.count

   #    @predictions.each do |p|
   #      isTrue = false
   #      Report.where(location: p.location).each do |r|
   #        sINr =(r.start < p.start and p.start < r.end)
   #        eINr =(r.start < p.end and p.start < r.end)
   #        isTrue = (isTrue or sINr or eINr)
   #      end #end Report.wher... do |r|

   #      if isTrue 
   #        @usrStats.correct += 1
   #      end #end isTrue

   #    end #end predictions.each do |p|

   #  end #end if user_signed_in

  	# @usrStats = RiceTest.new
  	# @usrStats = WbStat.new
  	# require '/Users/_-_/Documents/Poly/Poly Fall 2016/Software EG/Weatherbet/untitled folder/WeatherBet-Rails-/Weatherbet/Cstuff/rice_test'
	# @usrStats = WbStat.new
	# @blah = RiceTest.new
	# @usrStats.total = 12
  end

  def locations
    redirect_to "/locations"
  end

  def forums
  end

  def predictions
    redirect_to "/predictions"
  end

  def reports
    redirect_to "/reports"
  end

  def login
  end
end
