class TripsController < ApplicationController
	before_action :get_trip, only: [:index, :show, :edit, :update, :destroy]

	def index
		@trips = Trip.all
	end

	def show
	end

	def new
		user = User.find(params[:user_id].to_i)
		@trip = Trip.new
	end
	def create
		#need to create a new trip and add it push the user id to it like you did when you were seeding 
		#Finds the user by user_id and converts that id to an integer because it's currently a string and we need it to not be that, k!
		user = User.find(params[:user_id].to_i)
		#Then we create a new instance of a trip and pass the trip params
		@trip = Trip.new(trip_params)

		#if the new trip saves successfully
		if @trip.save
			#we add the user_id to that new trip, because trips belong to users...users have many trips
			user.trips << @trip
			#then we redirect back to that instance of new trip we just created! Yeah!
			redirect_to user
		#if that ish doesn't work....
		else
			#we re-render the new form
			render :new
		end
	end
	
	def edit
		user = User.find(params[:user_id])
	end

	def update
		if @trip.update(trip_params)
			redirect_to @trip
		else
			render :edit
		end
	end

	def destroy
		user = User.find(params[:user_id].to_i)
		@trip.destroy
		redirect_to user
	end

	private

	#route gets trip by id and is used in the before action so that I don't have to keep getting the trip by id
	def get_trip
		@trip = Trip.find(params[:id])
	end

	#Sets the params for making a new trip
	def trip_params
		params.require(:trip).permit(:name, :destination)
	end

end
