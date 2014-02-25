class Tweet < ActiveRecord::Base
	validates_presence_of :user_id, :tweet
	belongs_to :user
end
