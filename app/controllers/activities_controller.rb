class ActivitiesController < ApplicationController
	before_action :get_activity, only: [:index, :show, :edit, :update, :destroy]
	def index
		itin = Itinerary.find(params[:itinerary_id])
		@act = Activity.all
	end

	def show

	end

	def new
		itin = Itinerary.find(params[:itinerary_id].to_i)
		@act = Activity.new
	end

	def create
		itin = Itinerary.find(params[:itinerary_id].to_i)
		@act = Activity.new(activity_params)

		if @act.save
			itin.activities << @act
			redirect_to itin
		else
			render :action => :new
		end
	end
	
	def edit
	end

	def update
		itin = Itinerary.find(params[:itinerary_id])
		if @activity.update(activity_params)
			redirect_to itin
		else
			render :edit
		end
	end

	def destroy
		itin = Itinerary.find(params[:itinerary_id].to_i)
		@activity.destroy
		redirect_to itin
	end

	private

	def get_activity
		@activity = Activity.find(params[:id])
	end

	def activity_params
		params.require(:activity).permit(:item)
	end
end

