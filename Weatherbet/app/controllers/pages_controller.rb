class PagesController < ApplicationController
  def home
  end

  def weather 
    
  end

  def oldweather
    @hours = Array.new(1440)
    hoursFromNow = 0.0

    @hours.map! do |hour|
      hour = MArray.new
      class << hour
        # attr_accessor :locations
        # attr_accessor :start
        # attr_accessor :fin
        class << self
          attr_accessor :start
          attr_accessor :fin
        end
      end; #end class << hour

      hour.instance_variable_set(:@start, DateTime.now-120)
      hour.instance_variable_set(:@fin, hour.instance_variable_get(:@start))
      hour.instance_variable_set(:@fin, 1.0/24.0)

      Location.all.each do |loc|
        
        hour.push(loc)
        
        class << loc
          attr_accessor :score
        end

        loc.score = 0

        loc.predictions.each do |p|

          sINhour =(hour.instance_variable_get(:@start) < p.start and p.start < hour.instance_variable_get(:@fin))
          eINhour =(hour.instance_variable_get(:@start) < p.end and p.start < hour.instance_variable_get(:@fin))

          if sINhour or eINhour
            loc.score += p.user.weight
          end #if sINhour or eINhour
        end #end loc.predictions.each

      end #end Location.each
      
    end #end @hours.each
  end #end weather

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

  class MArray < Array
    class << self  
      attr_accessor :start
      attr_accessor :fin
    end

    @start = DateTime.new
    @fin = DateTime.new

    # attr_accessor :start
    # attr_accessor :fin
  end
end
