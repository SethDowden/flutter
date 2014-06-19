class UserController < ApplicationController
	def show
		@user = User.ci_find('username', params[:username])
		@tweets =  @user.tweets.order('created_at DESC').paginate(page: params[:page], per_page: 25)
	end
	
	def index
		@users = User.all.paginate(page: params[:page], per_page: 25)
	end

	def following
		@user = User.ci_find('username', params[:username])
	end

	def followers
		@user = User.ci_find('username', params[:username])
	end

	def settings
		@user = current_user
	end
end
