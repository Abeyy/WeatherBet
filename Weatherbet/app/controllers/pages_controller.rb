class PagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to "/locations"
    end
  end

  def weather
    redirect_to "/locations"
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
