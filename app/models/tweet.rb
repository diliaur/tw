class Tweet < ActiveRecord::Base
	#belongs_to :user
	#has_many :tags

	validates :content, presence: true
	validates :user_id, presence: true
	validates :tweet_created_at, presence: true
	validates :tweet_id, presence: true, uniqueness: true
	

	# is this too much? seriously
	def is_reply?
		this.is_reply
	end

	def is_retweet?
		this.is_retweet
	end

	# method: return tweets that are retweets
	# method: return tweets that are not retweets

	

	# query being tags
	def self.get_tweets_by_query(query = "")
	end

	def self.get_tweets_by_date_range(date="")
	end

	def self.get_tweets_by_query_and_date_range() #holy shit
	end

	def self.return_all_asc_by_creation
		result = self.order(created_at: :asc)
		result.all.each do |r|
			puts "#{r.tweet_id} : #{r.content} @ #{r.created_at}"
		end
		return ""
	end
end
