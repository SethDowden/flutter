class DashboardController < ApplicationController
	before_filter :authenticate_user!
	def show
		@feed = current_user.feed.order('created_at DESC').paginate(page: params[:page], per_page: 25)
		@user = current_user
		respond_to do |format|
		  format.html
		  format.js
		end
	end

	def following

	end

	def followers

	end
end