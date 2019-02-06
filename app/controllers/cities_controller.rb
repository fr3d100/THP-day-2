class CitiesController < ApplicationController

	def index
		@cities = City.all
		@top_city = City.first
		@cities.each do |city|
			if city.users.size > @top_city.users.size
				@top_city = city
			end
		end
	end

	def show
		@city = City.find(params["id"])
	end


end
