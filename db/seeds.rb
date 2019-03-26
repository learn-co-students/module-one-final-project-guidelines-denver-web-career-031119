require 'rest-client'
require 'pry'
require 'JSON'

#creating venue hash

red_rocks_parsed = JSON.parse(RestClient.get('https://app.ticketmaster.com/discovery/v2/venues.json?id=KovZpZAaeIvA&apikey=B8VjgGQLclytABJxaAOWtTQhG7LebO8l'))

fillmore_parsed = JSON.parse(RestClient.get('https://app.ticketmaster.com/discovery/v2/venues.json?id=KovZpZAE6eJA&apikey=B8VjgGQLclytABJxaAOWtTQhG7LebO8l'))

cervantes_parsed = JSON.parse(RestClient.get('https://app.ticketmaster.com/discovery/v2/venues.json?id=KovZpZAalekA&apikey=B8VjgGQLclytABJxaAOWtTQhG7LebO8l'))

ogden_parsed = JSON.parse(RestClient.get('https://app.ticketmaster.com/discovery/v2/venues.json?id=KovZpZAJv67A&apikey=B8VjgGQLclytABJxaAOWtTQhG7LebO8l'))

summit_parsed = JSON.parse(RestClient.get('https://app.ticketmaster.com/discovery/v2/venues.json?id=KovZpZAFFt1A&apikey=B8VjgGQLclytABJxaAOWtTQhG7LebO8l'))

marquis_parsed = JSON.parse(RestClient.get('https://app.ticketmaster.com/discovery/v2/venues.json?id=KovZpZAJeFkA&apikey=B8VjgGQLclytABJxaAOWtTQhG7LebO8l'))

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



## SQL injection (name, location, parking_details), (?, ?, ?)
## Seed database with Venue data

red_rocks = Venue.new(name: "Red Rocks Amphitheatre", location: '18300 W. Alameda Parkway, Morrison, CO', parking_details: "Parking is available on site. Price
  is included in the price of your ticket. Parking lots usually open 1/2 hour prior to door time. Come early to avoid traffic hassles and to get the best parking
  and best access to seating. Selected shows will have parking open earlier than the standard. Patrons are asked to follow directions of parking personnel
  and park as close as possible to other cars. **NOTE** NO OVERNIGHT CAMPING PERMITTED!! NOTE: Do not park on the Highway, at entrances to the Park,
  on private property, Alameda Parkway, or in the town of Morrison. Each of these areas is patrolled and you will be towed. Handicapped parking:
  Designated accessible parking for persons with disabilities is in two locations. Please check your tickets for the locations of your seats before
  parking. For access to the top of the amphitheatre, Row 70, parking is available in the Top Circle Lot. For access to the front row, Row 1, the parking is
  at the Upper South Lot. A valid, appropriate handicap placard or license plate is required to park in a space identified as reserved for persons with
  disabilities. All park entrances can access all parking lots.")
fillmore = Venue.new(name: "Fillmore Auditorium (Denver)", location: '1510 Clarkson, Denver, CO', parking_details: "Street parking & paid lots. Arrive Early. Paid lots not affiliated with Fillmore.")
cervantes = Venue.new(name: "Cervantes", location: '2637 Welton Street, Denver, CO', parking_details: nil)
ogden = Venue.new(name: "Ogden Theatre", location: '935 E. Colfax, Denver, CO', parking_details: "All parking for the Ogden Theatre is street parking. Please be aware of any residential parking areas that require a permit.")
summit = Venue.new(name: "Summit", location: '1902 Blake St, Denver, CO', parking_details: nil)
marquis = Venue.new(name: "Marquis Theatre", location: '2009 Larimer St, Denver, CO', parking_details: "Metered Parking all along Larimer St., Lot Parking behind the venue, next to venue, and across the street from Venue.")

## Seed database with Attraction data
