require 'rubygems'
require 'httparty'

class Plot
  include HTTParty
end

lat = 41.9618034362793
lon = -73.5147247314453
request = "http://forecast.weather.gov/meteograms/Plotter.php?lat=#{lat}&lon=#{lon}&wfo=ALY&zcode=NYZ066&gset=20&gdiff=10&unit=0&tinfo=EY5&ahour=0&pcmd=111011111100000000000000000000000000000000000000000000000&lg=en&indu=1!1!1&dd=0"
puts Plot.get(request)