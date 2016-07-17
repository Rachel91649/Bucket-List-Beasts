class TestsController < ApplicationController

	# def flight_price
	# 	# query format
	# 	# http://partners.api.skyscanner.net/apiservices/carhire/v2/pricing/{market}/{currency}/{locale}/...
	# end
	
	def party_time
		# SKYSCANNER_KEY = ENV["SKYSCANNER_KEY"]
		uri = "http://partners.api.skyscanner.net/apiservices/browsequotes/v1.0/GB/GBP/en-GB/LON/anywhere/anytime/anytime?apiKey=#{ENV["SKYSCANNER_KEY"]}"
		# uri = "http://partners.api.skyscanner.net/apiservices/reference/v1.0/countries/en-GB?apiKey=prtl6749387986743898559646983194"
		# id = params[:id] #interpolate the id params into the uri
		# puts "======================="
		# puts "my girl like to party all the time, party all the time, party all the tiiiimmmmme!"
		# puts "======================="
		# #Quick example
		# uri = "http://swapi.co/api/people/1"
		response = HTTParty.get(uri)
		# # puts response
		# #how can I parse through this data
		# # bracket notation because it comes back as a string
		
		puts "======================="
		puts "response data"
		puts "======================="
		#This is how I can access my data->Chain together bracket notation
		puts response["Quotes"][0]["MinPrice"]
		# puts uri
		puts "======================="
	end



end
