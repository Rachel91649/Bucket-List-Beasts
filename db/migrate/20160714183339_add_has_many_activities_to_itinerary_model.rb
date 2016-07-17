class AddHasManyActivitiesToItineraryModel < ActiveRecord::Migration
  def change
  	add_reference :activities, :itinerary, index: true
  end
end
