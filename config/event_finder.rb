require 'colored'
require_relative './methods.rb'
require_relative './environment.rb'

puts ""
puts "Hello! Welcome to Event Finder!"


def main_menu
  puts ""
  puts "What would you like to do?".bold
  puts ""
  puts "1 - See what events are happening on a certain date."
  puts "2 - See all upcoming small events."
  puts "3 - See all upcoming large events."
  puts "4 - See all upcoming events of tiny artists."
  puts "5 - See all upcoming events at a particular venue."
  puts "6 - Get more information about a particular venue."
  puts "7 - See all shows that fit your budget."
  puts "8 - See upcoming shows for a specific artist."
  puts "9 - See what events are trending."
  puts "10 - Exit the app."
  date_entered = gets.chomp
  case date_entered
  when "1"
    event_on_date
  when "2"
    show_small_events
  when "3"
    show_large_events
  when "4"
    show_events_tiny_artists
  when "5"
    playing_in_genre
  when "6"
    venue_details
  when "7"
    shows_under_budget
  when "8"
    shows_by_artist
  when "9"
    trending_events
  when "10"
    puts "Have a great day!"
    exit
  else
    puts "We're sorry, you entered an invalid input.".red
    main_menu
  end
end

def try_again(method_id)
  puts ""
  puts "Would you like to:"
  puts "1 - Try another search."
  puts "2 - Return to the main menu."
  puts "3 - Exit the app."
  response = gets.chomp
  if response == "1"
    case method_id
    when 1
      event_on_date
    when 2
      playing_in_genre
    when 3
      venue_details
    when 4
      shows_under_budget
    when 5
      shows_by_artist
    end
  elsif response == "2"
    main_menu
  elsif response == "3"
    puts "Have a great day!"
    exit
  else
    puts "Invalid input"
    try_again(method_id)
  end
end

def event_on_date
  puts "What date are you interested in? (Please follow the format of 1st Jan 2019)."
  date = gets.chomp
  who_is_playing(date)
  try_again(1)
end

def show_small_events
  small_events
  puts ""
  puts "Returning to main menu..."
  puts ""
  main_menu
end

def show_large_events
  large_events
  puts ""
  puts "Returning to main menu..."
  puts ""
  main_menu
end

def show_events_tiny_artists
  tiny_attractions
  puts ""
  puts "Returning to main menu..."
  puts ""
  main_menu
end

def list_venues
  puts ""
  puts "Please select a venue from the following list:"
  puts ""
  puts "1 - Red Rocks Amphitheatre"
  puts "2 - Fillmore Auditorium (Denver)"
  puts "3 - Cervantes"
  puts "4 - Ogden Theatre"
  puts "5 - Summit"
  puts "6 - Marquis Theatre"
  puts ""
end

def playing_in_genre
  list_venues
  selection = gets.chomp
  case selection
  when '1'
    playing_near_me("Red Rocks Amphitheatre")
  when '2'
    playing_near_me("Fillmore Auditorium (Denver)")
  when '3'
    playing_near_me("Cervantes")
  when '4'
    playing_near_me("Ogden Theatre")
  when '5'
    playing_near_me("Summit")
  when '6'
    playing_near_me("Marquis Theatre")
  else
    puts "Sorry, you've made an invalid selection.".red
    puts ""
    playing_in_genre
  end
  try_again(2)
end

def venue_details
  puts "Which venue would you like to learn more about?"
  list_venues
  selection = gets.chomp
  case selection
  when '1'
    print_venue_details("Red Rocks Amphitheatre")
  when '2'
    print_venue_details("Fillmore Auditorium (Denver)")
  when '3'
    print_venue_details("Cervantes")
  when '4'
    print_venue_details("Ogden Theatre")
  when '5'
    print_venue_details("Summit")
  when '6'
    print_venue_details("Marquis Theatre")
  else
    puts "Sorry, you've made an invalid selection.".red
    puts ""
    venue_details
  end
  puts ""
  try_again(3)
end

def shows_under_budget
  puts ""
  puts "What is your budget?"
  budget = gets.chomp.to_i
  shows_by_budget(budget)
  try_again(4)
end

def shows_by_artist
  puts ""
  puts "Please enter the artist's name."
  artist_name = gets.chomp
  shows_by_attraction(artist_name)
  try_again(5)
end

def trending_events
  puts "The following three events are trending now!"
  trending_event
  main_menu
end

main_menu
