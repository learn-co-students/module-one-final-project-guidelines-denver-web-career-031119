require 'color'
require_relative './cli-beta.rb'
require_relative './environment.rb'

puts "Hello! Welcome to Event Finder!"

def main_menu
  puts "What would you like to do today?"
  puts "1 - See what events are happening on a certain date."
  puts "4 - Exit the app."
  date_entered = gets.chomp
  case date_entered
  when "1"
    event_on_date
  when "4"
    puts "Have a great day!"
    exit
  else
    puts "We're sorry, you entered an invalid input. Please select from the list below.".red
    main_menu
  end
end

def try_again(method_id)
  puts "Would you like to:"
  puts "1 - Try another search."
  puts "2 - Return to the main menu."
  puts "3 - Exit the app."
  response = gets.chomp
  if response == "1"
    case method_id
    when 1
      event_on_date
    end
  elsif response == "2"
    main_menu
  elsif response == "3"
    puts "Have a great day!"
    exit
  else
    puts "Invalid input"
    try_again(method)
  end
end

def event_on_date
  puts "What date are you interested in? (Please follow the format of 1st Jan 2019)."
  date = gets.chomp
  who_is_playing(date)
end

main_menu
