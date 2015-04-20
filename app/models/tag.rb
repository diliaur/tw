class Tag < ActiveRecord::Base
	#belongs_to :user
	#belongs_to :tweet

	validates :content, presence: true
	validates :parent_created_at, presence: true
	validates :parent_tweet_id, presence: true
	validates :parent_user_id, presence: true
end
