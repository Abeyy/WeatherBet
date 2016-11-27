require 'rubygems'
require 'httparty'

class Plot
  include HTTParty
  # base_uri 'whoismyrepresentative.com'
  base_uri 'http://forecast.weather.gov/'
  # default_params :output => 'json'
  default_params :output => 'png'
  # format :json
  format :plain

  def self.find_by_coords(lat, lon)
    get('/meteograms/Plotter.php', :query => 
    	{:lat => lat, :lon => lon})
  end
  
  # def self.find_by_zip(zip)
  #   get('/whoismyrep.php', :query => {:zip => zip})
  # end
  
  # def self.get_all_by_name(last_name)
  #   get('/getall_reps_byname.php', :query => {:lastname => last_name})
  # end
end

# puts Representative.get_all_by_name('Donnelly').inspect
 puts Plot.find_by_coords(41.9618034362793, -73.5147247314453).inspect
# {"results"=>[{"district"=>"2", "last"=>"Donnelly", "first"=>"Joe", "state"=>"IN", "party"=>"D"}]}