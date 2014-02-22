class TweetController < ApplicationController

  def create
  	@tweet = current_user.tweets.create params[:tweet].permit(:tweet)
  	@tweet.save
    redirect_to :back
  end

  def destory
  	@tweet = current_user.tweet.where(:id => params[:tweet][:id])
  	if @tweet.destroy
  		redirect_to :back
  	end
  end 
end
