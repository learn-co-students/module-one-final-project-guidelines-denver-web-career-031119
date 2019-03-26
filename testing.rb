require 'rest-client'
require 'pry'
require 'JSON'

#creating venue hash

red_rocks_parsed = JSON.parse(RestClient.get('https://app.ticketmaster.com/discovery/v2/venues.json?id=KovZpZAaeIvA&apikey=B8VjgGQLclytABJxaAOWtTQhG7LebO8l'))

fillmore_parsed = JSON.parse(RestClient.get('https://app.ticketmaster.com/discovery/v2/venues.json?id=KovZpZAE6eJA&apikey=B8VjgGQLclytABJxaAOWtTQhG7LebO8l'))

cervantes_parsed = JSON.parse(RestClient.get('https://app.ticketmaster.com/discovery/v2/venues.json?id=KovZpZAalekA&apikey=B8VjgGQLclytABJxaAOWtTQhG7LebO8l'))

ogden_parsed = JSON.parse(RestClient.get('https://app.ticketmaster.com/discovery/v2/venues.json?id=KovZpZAJv67A&apikey=B8VjgGQLclytABJxaAOWtTQhG7LebO8l'))

summit_parsed = JSON.parse(RestClient.get('https://app.ticketmaster.com/discovery/v2/venues.json?id=KovZpZAFFt1A&apikey=B8VjgGQLclytABJxaAOWtTQhG7LebO8l'))

Marquis_parsed = JSON.parse(RestClient.get('https://app.ticketmaster.com/discovery/v2/venues.json?id=KovZpZAJeFkA&apikey=B8VjgGQLclytABJxaAOWtTQhG7LebO8l'))

def build_ven_data(parsed)
  venue_hash = {}
  venue_hash["name"] = parsed["_embedded"]["venues"][0]["name"]
  venue_hash["city"] = parsed["_embedded"]["venues"][0]["city"]["name"]
  venue_hash["state"] = parsed["_embedded"]["venues"][0]["state"]["stateCode"]
  venue_hash["address"] = parsed["_embedded"]["venues"][0]["address"]["line1"]
  venue_hash["country"] = parsed["_embedded"]["venues"][0]["country"]["countryCode"]
  venue_hash["parkingDetail"] = parsed["_embedded"]["venues"][0]["parkingDetail"]
  venue_hash["boxOfficeInfo"] = parsed["_embedded"]["venues"][0]["boxOfficeInfo"]
  venue_hash
end

binding.pry


#start even hash

red_rocks_events_parsed = JSON.parse(RestClient.get('https://app.ticketmaster.com/discovery/v2/events.json?venueId=KovZpZAaeIvA&apikey=B8VjgGQLclytABJxaAOWtTQhG7LebO8l'))

fillmore_events_parsed = JSON.parse(RestClient.get('https://app.ticketmaster.com/discovery/v2/events.json?venueId=KovZpZAE6eJA&apikey=B8VjgGQLclytABJxaAOWtTQhG7LebO8l'))

red_rocks_events_parsed = JSON.parse(RestClient.get('https://app.ticketmaster.com/discovery/v2/events.json?venueId=KovZpZAaeIvA&apikey=B8VjgGQLclytABJxaAOWtTQhG7LebO8l'))

red_rocks_events_parsed = JSON.parse(RestClient.get('https://app.ticketmaster.com/discovery/v2/events.json?venueId=KovZpZAaeIvA&apikey=B8VjgGQLclytABJxaAOWtTQhG7LebO8l'))

red_rocks_events_parsed = JSON.parse(RestClient.get('https://app.ticketmaster.com/discovery/v2/events.json?venueId=KovZpZAaeIvA&apikey=B8VjgGQLclytABJxaAOWtTQhG7LebO8l'))

red_rocks_events_parsed = JSON.parse(RestClient.get('https://app.ticketmaster.com/discovery/v2/events.json?venueId=KovZpZAaeIvA&apikey=B8VjgGQLclytABJxaAOWtTQhG7LebO8l'))

red_rocks_events_parsed = JSON.parse(RestClient.get('https://app.ticketmaster.com/discovery/v2/events.json?venueId=KovZpZAaeIvA&apikey=B8VjgGQLclytABJxaAOWtTQhG7LebO8l'))

def build_event_data(parsed)
  event_hash = {}
  parsed["_embedded"]["events"].each do |event|
    event_hash[event["name"]] = {}
    event_hash[event["name"]]["venue"] = event["_embedded"]["venues"][0]["name"]
    event_hash[event["name"]]["attractions"] = event["_embedded"]["attractions"][0]["name"]
    event_hash[event["name"]]["date"] = event["dates"]["start"]["localDate"]
  end
  event_hash
end

binding.pry
