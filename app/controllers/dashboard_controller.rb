class DashboardController < ApplicationController
	before_filter :authenticate_user!
	def show
		
	end

	def following
		@following = current_user.following
	end

	def followers
		@followers = current_user.followers
	end

end