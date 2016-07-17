class Trip < ActiveRecord::Base
	validates :name, presence: true
	validates :destination, presence: true
	
	belongs_to :users
	has_many :itineraries
end
