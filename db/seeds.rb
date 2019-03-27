Venue.destroy_all
Event.destroy_all
Attraction.destroy_all


## SQL injection (name, location, parking_details), (?, ?, ?)
## Seed database with Venue data

red_rocks = Venue.create(name: "Red Rocks Amphitheatre", location: '18300 W. Alameda Parkway, Morrison, CO', parking_details: "Parking is available on site. Price
  is included in the price of your ticket. Parking lots usually open 1/2 hour prior to door time. Come early to avoid traffic hassles and to get the best parking
  and best access to seating. Selected shows will have parking open earlier than the standard. Patrons are asked to follow directions of parking personnel
  and park as close as possible to other cars. **NOTE** NO OVERNIGHT CAMPING PERMITTED!! NOTE: Do not park on the Highway, at entrances to the Park,
  on private property, Alameda Parkway, or in the town of Morrison. Each of these areas is patrolled and you will be towed. Handicapped parking:
  Designated accessible parking for persons with disabilities is in two locations. Please check your tickets for the locations of your seats before
  parking. For access to the top of the amphitheatre, Row 70, parking is available in the Top Circle Lot. For access to the front row, Row 1, the parking is
  at the Upper South Lot. A valid, appropriate handicap placard or license plate is required to park in a space identified as reserved for persons with
  disabilities. All park entrances can access all parking lots.")
fillmore = Venue.create(name: "Fillmore Auditorium (Denver)", location: '1510 Clarkson, Denver, CO', parking_details: "Street parking & paid lots. Arrive Early. Paid lots not affiliated with Fillmore.")
cervantes = Venue.create(name: "Cervantes", location: '2637 Welton Street, Denver, CO', parking_details: nil)
ogden = Venue.create(name: "Ogden Theatre", location: '935 E. Colfax, Denver, CO', parking_details: "All parking for the Ogden Theatre is street parking. Please be aware of any residential parking areas that require a permit.")
summit = Venue.create(name: "Summit", location: '1902 Blake St, Denver, CO', parking_details: nil)
marquis = Venue.create(name: "Marquis Theatre", location: '2009 Larimer St, Denver, CO', parking_details: "Metered Parking all along Larimer St., Lot Parking behind the venue, next to venue, and across the street from Venue.")

## Seed database with Attraction data

#red rocks
snoop_dogg = Attraction.create(artist: "Snoop Dogg", genre: "Hip-Hop/Rap", sub_genre: "Urban")
luke_combs = Attraction.create(artist: "Luke Combs", genre: "Country", sub_genre: "Country")
lauren_daigle = Attraction.create(artist: "Lauren Daigle", genre: "Religious", sub_genre: "Gospel")
#fillmore
lil_baby = Attraction.create(artist: "Lil Baby", genre: "Hip-Hop/Rap", sub_genre: "Hip-Hop/Rap")
brett_young = Attraction.create(artist: "Brett Young", genre: "Folk", sub_genre: "Folk")
#cervantes
dababy = Attraction.create(artist: "DaBaby", genre: "Hip-Hop/Rap", sub_genre: "Urban")
earl_sweatshirt = Attraction.create(artist: "Earl Sweatshirt", genre: "Hip-Hop/Rap", sub_genre: "Urban")
 #ogden
maggie_rogers = Attraction.create(artist: "Maggie Rogers", genre: "Pop", sub_genre: "Synth Pop")
empire_of_the_sun = Attraction.create(artist: "Empire of the Sun", genre: "Rock", sub_genre: "Pop")
#summit
gunna = Attraction.create(artist: "Gunna", genre: "Hip-Hop/Rap", sub_genre: "Hip-Hop/Rap")
taking_back_sunday = Attraction.create(artist: "Taking Back Sunday", genre: "Rock", sub_genre: "Alternative Rock")
#marquis
lil_tracy = Attraction.create(artist: "Lil Tracy", genre: "Hip-Hop/Rap", sub_genre: "Hip-Hop/Rap")
the_national_parks = Attraction.create(artist: "The National Parks", genre: "Other", sub_genre: "Other")

## Seed database with Event data

# create_table :events do |t|
#   t.text :name
#   t.text :date
#   t.integer :price
#   t.integer :popularity
#   t.references :attraction
#   t.references :venue

## red rocks
snoop_dogg_e1 = Event.create(name: 'Snoop', date: 'April 18 2019', price: 144, popularity: 0, attraction: snoop_dogg, venue: red_rocks)
luke_combs_e1 = Event.create(name: 'Luke Combs with LANco', date: 'May 12 2019', price: 307, popularity: 0, attraction: luke_combs, venue: red_rocks)
lauren_daigle_e1 = Event.create(name: 'Lauren Daigle', date: 'September 29 2019', price: 81, popularity: 0, attraction: lauren_daigle, venue: red_rocks)
snoop_dogg_e2 = Event.create(name: 'Snoopy D', date: 'July 06 2019', price: 127, popularity: 0, attraction: snoop_dogg, venue: red_rocks)
luke_combs_e2 = Event.create(name: 'Luke Combs with TCP/IP', date: 'October 19 2019', price: 213, popularity: 0, attraction: luke_combs, venue: red_rocks)
lauren_daigle_e2 = Event.create(name: 'Lauren Daigle', date: 'July 27 2019', price: 45, popularity: 0, attraction: lauren_daigle, venue: red_rocks)

##fillmore
lil_baby_e1 = Event.create(name: 'Lil Baby - The New Generation Tour', date: 'March 25 2019', price: 69, popularity: 0, attraction: lil_baby, venue: fillmore)
brett_young_e1 = Event.create(name: 'Brett Young', date: 'April 20 2019', price: 120, popularity: 0, attraction: brett_young, venue: fillmore)

##cervantes
dababy_e1 = Event.create(name: 'DaBaby', date: 'April 17 2019', price: 53, popularity: 0, attraction: dababy, venue: cervantes)
earl_sweatshirt_e1 = Event.create(name: 'Earl Sweatshirt', date: 'April 11 2019', price: 49, popularity: 0, attraction: earl_sweatshirt, venue: cervantes)

##ogden
maggie_rogers_e1 = Event.create(name: 'Maggie Rogers', date: 'April 09 2019', price: 110, popularity: 0, attraction: maggie_rogers, venue: ogden)
maggie_rogers_e2 = Event.create(name: 'Maggie Rogers', date: 'April 10 2019', price: 119, popularity: 0, attraction: maggie_rogers, venue: ogden)
empire_of_the_sun_e1 = Event.create(name: 'Empire of the Sun', date: 'June 15 2019', price: 61, popularity: 0, attraction: empire_of_the_sun, venue: ogden)
empire_of_the_sun_e2 = Event.create(name: 'Empire of the Sun', date: 'June 16 2019', price: 53, popularity: 0, attraction: empire_of_the_sun, venue: ogden)

##summit
gunna_e1 = Event.create(name: 'Gunna', date: 'April 14 2019', price: 30, popularity: 0, attraction: gunna, venue: summit)
taking_back_sunday_e1 = Event.create(name: 'Taking Back Sunday', date: 'May 01 2019', price: 35, popularity: 0, attraction: taking_back_sunday, venue: summit)

##marquis
lil_tracy_e1 = Event.create(name: 'Lil Tracy', date: 'April 07 2019', price: 15, popularity: 0, attraction: lil_tracy, venue: marquis)
the_national_parks_e1 = Event.create(name: 'The National Parks', date: 'April 19 2019', price: 15, popularity: 0, attraction: the_national_parks, venue: marquis)

# binding.pry
# 1
