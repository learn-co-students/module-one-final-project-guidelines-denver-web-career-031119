require 'require_all'
require 'pry'
require_relative './environment.rb'

def print_events (events)
  attractions = events.map(&:attraction).map(&:artist)
  venues = events.map(&:venue).map(&:name)

  i = 0
  while i < events.length
    puts "#{attractions[i]} is playing at #{venues[i]}"
    i += 1
  end
end

def print_events_with_date (events)
  attractions = events.map(&:attraction).map(&:artist)
  venues = events.map(&:venue).map(&:name)
  event_date = events.map(&:date)

  i = 0
  while i < events.length
    puts "#{attractions[i]} is playing at #{venues[i]} on #{event_date[i][0...-4]}"
    i += 1
  end
end

def event_by_venue(venue)
  Event.all.select{|event| event.venue == venue}
end

def event_by_attraction(attraction)
  Event.all.select{|event| event.attraction == attraction}
end

def event_by_genre(genre)
  Event.all.select{|event| event.attraction.genre == genre}
end

def who_is_playing(date)
  events = Event.all.select { |event| event.date == date }
  print_events(events)
end

def average_ticket_price
  ticket_prices = Event.all.map(&:price)
  return ticket_prices.inject(:+) / ticket_prices.size
end

def small_events
  #generate all of the shows where the price is < 50% of the average of all events
  small_event = Event.all.select do |event|
    event.price < average_ticket_price * 0.5
  end
  if small_event.count == 0
    puts "We're sorry, there are no small events upcoming in your area."
  else
    puts "The upcoming small events in your area are:"
    puts ""
    print_events_with_date(small_event)
  end
end

def large_events
  #generate all of the shows where the price is > XX% of the average of all events
  large_event = Event.all.select do |event|
    event.price > average_ticket_price * 0.5
  end
  if large_event.count == 0
    puts "We're sorry, there are no large events upcoming in your area."
  else
    puts "The upcoming large events in your area are:"
    puts ""
    print_events_with_date(large_event)
  end
end

def event_by_day(day)
  events = Event.all.select do |event|
    Date.parse(event.date).wday == day
  end
end

def weekend_events
  [event_by_day(5), event_by_day(6)].flatten
end

def playing_near_me(venue_name)
  #shows all events happening at that venue in a given genre
  relevant_events = event_by_venue(Venue.find_by(name: venue_name))
end

def shows_by_budget(price)
  #returns all shows that fit your budget (potentially add column that flags venues that are near public transport)
end

def trending_event(date)
  #returns information related to the most popular event by date
end

binding.pry
# 1
