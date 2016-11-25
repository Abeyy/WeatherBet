class PagesController < ApplicationController
  def home
  end

  def weather
  	# require "#{Rails.root}/Cstuff/rice_test"
  	# @stat = RiceTest.new
  	# @stat = WbStat.new
  	require '/Users/_-_/Documents/Poly/Poly Fall 2016/Software EG/Weatherbet/untitled folder/WeatherBet-Rails-/Weatherbet/Cstuff/rice_test'
	# @stat = WbStat.new
	# @blah = RiceTest.new
	# @stat.total = 12
  end

  def locations
  end
end
