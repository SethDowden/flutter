class DashboardController < ApplicationController
	before_filter :authenticate_user!
	def show
		@tweet = Tweet.new
	end
end