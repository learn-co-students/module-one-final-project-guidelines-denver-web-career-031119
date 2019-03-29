require 'require_all'
require 'pry'
require 'colored'
require_relative './environment.rb'

def build_genre_hash(events)
  attraction_genres = events.map(&:attraction).map(&:genre).uniq
  genres = {}
    attraction_genres.each do |genre|
      genres[genre] = events.map(&:attraction).select do |attraction|
      attraction.genre == genre
    end
  end
  genres
end

def print_events (event, int)
  events = event.sort_by{|event| Date.parse(event.date)}
  attractions = events.map(&:attraction).map(&:artist)
  venues = events.map(&:venue).map(&:name)
  price = events.map(&:price)
  event_date = events.map(&:date)

  i = 0
  if int == 1 || int == 2 || int == 4
    while i < events.length
      if int == 1
        puts "#{attractions[i]} is playing at #{venues[i]}".green
      elsif int == 2
        puts "#{attractions[i]} is playing at #{venues[i]} on the #{event_date[i][0...-9]} of #{event_date[i][-8...-5]}.".green
      elsif int == 4
        puts "#{attractions[i]} is playing at #{venues[i]} on the #{event_date[i][0...-9]} of #{event_date[i][-8...-5]} for $#{price[i]}.".green
      end
      i += 1
    end
  elsif int == 3
    genres = build_genre_hash(events)
    while i < genres.keys.length
      puts ""
      puts "#{genres.keys[i]}:".bold.underline
      puts "#{genres[genres.keys[i]].map(&:artist).uniq.join(", ")}"
      i += 1
    end
  end
end

def bump_popularity(events, amount)
  events.map{|event| event.update(popularity: event.popularity + amount)}
end

def print_venue_details (venue_name)
  venue_location = Venue.all.find { |venue| venue.name == venue_name }.location
  venue_parking = Venue.all.find { |venue| venue.name == venue_name }.parking_details

  puts ""
  puts "#{venue_name}".bold.underline.cyan
  puts "Address:".underline + " #{venue_location}"
  puts "Parking information:".underline
  if venue_parking != nil
    print "#{venue_parking}"
  else
    print "Sorry, we do not have any information about parking for this venue."
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
  bump_popularity(events, 1)
  if events.length > 0
    print_events(events, 1)
  else
    puts "We're sorry, there are no shows on this date.".yellow
  end
end

def average_ticket_price
  ticket_prices = Event.all.map(&:price)
  return ticket_prices.inject(:+) / ticket_prices.size
end

def small_events
  small_event = Event.all.select do |event|
    event.price < average_ticket_price * 0.5
  end
  bump_popularity(small_event, 1)
  if small_event.count == 0
    puts "We're sorry, there are no small events upcoming in your area.".yellow
    try_again(2)
  else
    puts "The upcoming small events in your area are:"
    puts ""
    print_events(small_event, 2)
  end
end

def tiny_attractions
  tiny_events = Event.select do |event|
    event.attraction.artist[0..2] == "Lil"
  end
  bump_popularity(tiny_events, 1)
  print_events(tiny_events, 2)
end

def large_events
  large_event = Event.all.select do |event|
    event.price > average_ticket_price * 1.25
  end
  bump_popularity(large_event, 1)
  if large_event.count == 0
    puts "We're sorry, there are no large events upcoming in your area.".yellow
  else
    puts "The upcoming large events in your area are:"
    puts ""
    print_events(large_event, 2)
  end
end

def event_by_day(day)
  events = Event.all.select do |event|
    Date.parse(event.date).wday == day
  end
  bump_popularity(events, 1)
end

def weekend_events
  [event_by_day(5), event_by_day(6)].flatten
end

def playing_near_me(venue_name)
  #shows all events happening at that venue in a given genre
  relevant_events = event_by_venue(Venue.find_by(name: venue_name))
  print_events(relevant_events, 3)
  bump_popularity(relevant_events, 1)
end

def shows_by_budget(price)
  events = Event.all.select { |event| event.price <= price}
  if events.length > 0
    print_events(events, 4)
    bump_popularity(events, 1)
  else
    puts "We're sorry, there are no shows that fit your budget."
  end
end

def shows_by_attraction(artist_name)
  events = Event.all.select{|event| event.attraction.artist == artist_name}
  if events.length > 0
    bump_popularity(events, 2)
    print_events(events, 4)
  else
    puts "We're sorry, #{artist_name} does not have any upcoming shows."
  end
end

def trending_event
  events = Event.all.order(:popularity).reverse[0..2]
  bump_popularity(events, 0.5)
  print_events(events, 4)
end
