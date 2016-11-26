class PagesController < ApplicationController
  def home
  end

  def weather
  	require "#{Rails.root}/Cstuff/rice_test"
  end

  def locations
  end

  def forums
  end

  def login
  end
end
