class AddHasManyItinerariesToTripModel < ActiveRecord::Migration
  def change
  	add_reference :itineraries, :trip, index: true
  end
end
