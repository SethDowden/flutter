class DashboardController < ApplicationController
	before_filter :authenticate_user!
	def show
		@feed = current_user.feed.order('created_at DESC')
		@user = current_user
	end

	def following

	end

	def followers

	end
end