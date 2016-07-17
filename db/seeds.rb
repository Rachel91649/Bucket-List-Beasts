# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Trip.delete_all
Itinerary.delete_all
Activity.delete_all

Trip.create([{ name: "Holiday", destination: "Paris" }, { name: "Birthday", destination: "Las Vegas"}])
Itinerary.create([{ purpose: "relax" }, { purpose: "turn-up" }])
Activity.create([{ item: "beach" }, { item: "flea market"}, { item: "museum" }, { item: "party" }])

user1 = User.find_by(email: "hello@hello.com")
trip1 = Trip.find_by(name: "Holiday")
trip2 = Trip.find_by(name: "Birthday")

itin1 = Itinerary.find_by(purpose: "relax")
itin2 = Itinerary.find_by(purpose: "turn-up")

act1 = Activity.find_by(item: "beach")
act2 = Activity.find_by(item: "flea market")
act3 = Activity.find_by(item: "museum")
act4 = Activity.find_by(item: "party")

user1.trips
user1.trips.count
user1.trips << trip1
user1.trips
user1.trips.count
user1.trips << trip2

trip1.itineraries << itin1
trip1.itineraries << itin2

itin1.activities << act1
itin1.activities << act2
itin1.activities << act3
itin2.activities << act4
