require 'color'
require_relative './cli-beta.rb'
require_relative './environment.rb'

puts "Hello!"
def date
  puts "What date are you interested in?"
  date_entered = gets.chomp

  who_is_playing(date_entered)
end

date
