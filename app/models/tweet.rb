# require 'twitter' # do I need to do this?
class Tweet < ActiveRecord::Base
	#belongs_to: User

	#write something that gets tweets

	#want to do:
	# 1. get tweets by tag
	# 2. get tweets by date range
	# 3. save tweets into database..but can't I do that automatically?
	#    where should I put that functionality?
	# 4. ...

	# query being tags
	def self.get_tweets_by_query(query = "")
		twitter.search()
	end

	def self.get_tweets_by_date_range(date="")
	end

	def self.get_tweets_by_query_and_date_range() #holy shit
	end

	# instance methods
	def create_from_read(tweet_obj) # do I need this?
	end

	# then write rake task to run tweet queries/saves
	# rake should pick the methods out of Tweet, not write them itself
end
