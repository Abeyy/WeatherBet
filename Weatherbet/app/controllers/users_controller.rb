class UsersController < ApplicationController
  def show
  	require "#{Rails.root}/Cstuff/rice_test"
    @user = current_user
    if user_signed_in?    

      @usrStats = WbStat.new 
      @usrStats.correct = current_user.correctPredictions
      @usrStats.total   = current_user.totalPredictions

      
    end #end if user_signed_in
  end
end
