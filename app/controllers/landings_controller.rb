class LandingsController < ApplicationController
	before_action :authenticate_user!, only: :secure

	def index
		# id = current_user.id
		# user = User.find(id)
		# @user = User.find(params[:user_id])
		if current_user
			puts "I am logged in as #{current_user.email}"
			# redirect_to current_user_url
		else
			puts "I'm not logged in"
		end
	end

	def secure
		id = current_user.id
		user = User.find(id)
		puts "==================="
		p user
		puts "==================="

	end


end
