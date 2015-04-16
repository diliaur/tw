# get hashtags off a Tweet object
# returning tweets using #hashtags method on a tweet obj will return a
#    Hashtag(s) object hash with tags inside of it.

# takes enumerable collection object of tweets or whatever
# e.g. Twitter::SearchResults
# returns an array of tweets
# THIS IS USELESS! need to store in a model instead... and use an array
#   like this to process and keep the data we want
def return_tweet_text (enumerable_tweets)

	tweet_array = Array.new

	enumerable_tweets.each do |et|
		#puts et.text # prints, need to save to array or obj
		tweet_array << et.text
	end

	return tweet_array
end

# get tweets by tags

#def get_tweets_by_tag ()
#end