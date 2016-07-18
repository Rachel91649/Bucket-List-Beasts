class ItinerariesController < ApplicationController
	before_action :get_itin, only: [:index, :show, :edit, :update, :destroy]
	def index
		trip = Trip.find(params[:trip_id])
		@itin = Itinerary.all
	end

	def show

	end

	def new
		trip = Trip.find(params[:trip_id].to_i)
		@itin = Itinerary.new
	end

	def create
		trip = Trip.find(params[:trip_id].to_i)
		@itin = Itinerary.new(itin_params)

		if @itin.save
			trip.itineraries << @itin
			redirect_to trip
		else
			render :action => :new
		end
	end
	
	def edit
	end

	def update
		trip = Trip.find(params[:trip_id])
		#why is there no update route made yet!!!?? you faaking slacker, shit!
		if @itin.update(itin_params)
			redirect_to trip
		else
			render :edit
		end
	end

	def destroy
	  trip = Trip.find(params[:trip_id])
		@itin.destroy
		redirect_to current_user
	end

	private

	def get_itin
		@itin = Itinerary.find(params[:id])
	end

	def itin_params
		params.require(:itinerary).permit(:purpose)
	end
end
