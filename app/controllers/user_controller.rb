class UserController < ApplicationController
	def show
		puts "srt"
		puts "@@@@"

		@user = User.ci_find('username', params[:username])
		puts @user
	end
end
