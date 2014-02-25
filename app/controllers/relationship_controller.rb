class RelationshipController < ApplicationController
	before_filter :authenticate_user!

	def create
		puts
		current_user.follow!(User.where(:id => params[:id]).first)
		redirect_to :back
	end

	def destroy 
		current_user.relationships.find_by(followed_id: params[:id]).destroy
		redirect_to :back
	end
end
