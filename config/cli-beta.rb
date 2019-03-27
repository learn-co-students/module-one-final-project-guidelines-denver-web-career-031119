require 'require_all'
require 'pry'
require_relative './environment.rb'

def who_is_playing(date)
  events = Event.all.select { |event| event.date == date }
  attractions = events.map(&:attraction).map(&:artist)
  venues = events.map(&:venue).map(&:name)

  i = 0
  while i < events.length
    puts "#{attractions[i]} is playing at #{venues[i]}"
    i += 1
  end

end

# who_is_playing('May 01 2019')
# binding.pry
# 1
