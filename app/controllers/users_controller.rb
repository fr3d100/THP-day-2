class UsersController < ApplicationController

	def index
		@users = User.all
		@top_user = User.first
		@users.each do |user|
			if user.gossips.size > @top_user.gossips.size
				@top_user = user
			end
		end
	end

	def show
		@user = User.find(params['id'])
	end

end
