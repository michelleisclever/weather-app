#SkillCrush 104 - Weather app
#Michelle McManus
#April 2 2016

require 'barometer'

def get_locations_weather(location)
  Barometer.new(location).measure
end

#get the location
puts "Where are you? Please enter city or zip code:"
user_location=gets.chomp

#condition
weather = get_locations_weather(user_location)
today = Time.now.strftime('%d').to_i
tomorrow = Time.now.strftime('%d').to_i + 1

#puts "Current weather conditions: " + weather.current.temperature

puts "Current conditions in #{user_location}: " + weather.temperature.f.to_s + " degrees and " + weather.current.icon + "."

weather.forecast.each do |forecast|
    day = forecast.starts_at.day
    
if
    day == tomorrow
    dayName = 'Tomorrow'
else
    dayName = forecast.starts_at.strftime('%A')
  end
    

    puts dayName + ' is going to be ' + forecast.icon + ' with a low of ' + forecast.low.f.to_s + ' and a high of ' + forecast.high.f.to_s
end


    