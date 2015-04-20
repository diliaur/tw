#require 'twitter'

module TalkingToTwitter
  # ----------------------------------------------------------------- #
  #                                                                   #
  #                    Twitter Interfacing Stuff!                     #
  #                                                                   #
  # ----------------------------------------------------------------- #

  #takes a tag in form '#hashtag' minus quotes
  #loads the tweets, will be enumerable object. not sure if it is a
  # stream so will try to limit to 100
  # also will create new db objects (Tweet, Tag, User)
  def self.load_tweets_by_tag(tag)
    # no RTs, limit 100 per call
    result = TCLIENT.search("#{tag} -rt",:lang=>"en").take(100)
    count = 0
    result.each do |r|
      #print "[#{count}] #{r.text} ; TAGS: ["
      hashtags = ""
      r.hashtags.each do |h|
        hashtags += "#{h.text}," #trailing , doesn't matter, .split(",") takes care of it
      end
      #print hashtags
      #print "]; #{r.created_at} \n"
      count = count + 1
      new_user = self.create_user(r)
      new_tweet = self.create_tweet(new_user,r,hashtags)

      if new_tweet.valid?
        puts "tweet valid, storing Tags"
        #puts "#{new_tweet.tags}"
        if new_tweet.tags != nil && new_tweet.tags != ""
          #puts "ENTERED TAGZONE"
          self.transform_hashtags(new_tweet) #do the modxzzzz
        end
      else
        puts "ERROR: tweet not stored"
      end

      puts "---"
    end
    puts "number of tweets processed: #{count}"
  end

  # create tag objects from string list contained in each Internal Tweet
  def self.transform_hashtags(tweet)
    tag_array = tweet.tags.split(",")
    #puts "==="
    #puts tag_array
    if !tag_array.empty? || !tag_array.nil? # use || bc can't be BOTH nil and empty
      tag_array.each do |t|
        new_tag = Tag.create(content:t,
                parent_created_at:tweet.tweet_created_at,
                parent_tweet_id:tweet.id,
                parent_user_id:tweet.user_id)
        #puts new_tag.content
      end
    end
    #puts "==="
  end

  # create a user
  # checks first to see if user by that screen_name exists
  # if so it returns the user
  # otherwise creates the user and returns it
  # return should never be nil because tweet creation depends on it
  def self.create_user(tweet)
    sn = tweet.user.screen_name
    new_user = User.find_by(screen_name: sn)
    if new_user == nil
      new_user = User.create(screen_name: sn)
    end
    return new_user
  end

  # create a tweet
  # param user - an internal object, not a Twitter object
  # param tweet - a Twitter object, not an internal object
  # param hashtags - a CSV string of hashtags from original read of tweet
  def self.create_tweet(user,tweet,hashtags=nil)
    #puts user.screen_name
    #puts user.id
    #puts tweet.created_at
    Tweet.create(content:tweet.text,
                 tags:hashtags,
                 user_screen_name:user.screen_name,
                 user_id:user.id,
                 #tweet_id:r.id, #may need :limit or something, big number
                 tweet_created_at:tweet.created_at) 
  end

  def self.test
    puts "this is a test"
  end

end