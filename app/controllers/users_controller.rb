class UsersController < ApplicationController
	# before_action :authenticate_user!, only: :show
	before_action :get_user, only: [:show, :edit, :update, :destroy]
	
	def index
		#this will let me list all the users on an index page(if I want)
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		#I need to get trips by the user id, not by the trip id
		#@trips = trips by id where the user id is...
		# @trips = Trip.find(params[:user_id])
	end

	def create
	end
	
	def edit
	end

	def update
	end

	def destroy
	end

	private

	def get_user
		@user = User.find(params[:id])
	end
end