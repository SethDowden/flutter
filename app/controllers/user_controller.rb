class UserController < ApplicationController
	def show
		@user = User.ci_find('username', params[:username])
	end
	
	def following
		@following = User.ci_find('username', params[:username])
	end

	def followers
		@followers = User.ci_find('username', params[:username])
	end
end
