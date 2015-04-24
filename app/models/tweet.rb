class Tweet < ActiveRecord::Base
	#belongs_to :user
	#has_many :tags

	validates :content, presence: true
	validates :user_id, presence: true
	validates :tweet_created_at, presence: true
	validates :tweet_id, presence: true, uniqueness: true
	
	# query being tags
	def self.get_tweets_by_query(query = "")
	end

	def self.get_tweets_by_date_range(date="")
	end

	def self.get_tweets_by_query_and_date_range() #holy shit
	end

	# instance methods
	def create_from_read(tweet_obj) # do I need this?
	end

	def self.get_by_user(user)
		return Tweet.where(user_id: user).find_each
	end

end
