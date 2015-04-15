# get hashtags off a Tweet object
# returning tweets using #hashtags method on a tweet obj will return a
#    Hashtag(s) object hash with tags inside of it.

# can take single tweet object or collection of tweet objects?
# um need to rethink this probably
def get_tags (tweet)
	tweet.each do |h|
		puts h.text # prints, need to save to array or obj
	end
end

# get tweets by tags

#def get_tweets_by_tag ()
#end