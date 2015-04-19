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
    result = TCLIENT.search("#{tag} -rt",:lang=>"en",:limit=>10)
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
      #puts count
      #create Tweet object
      new_tweet = Tweet.create(content:r.text,
                               tags:hashtags,
                               user_id:r.user.screen_name,
                               #tweet_id:r.id, #may need :limit or something, big number
                               tweet_created_at:r.created_at)
      if new_tweet.valid?
        puts "tweet stored"
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
    puts "number of tweets: #{count}"
  end

  def self.transform_hashtags(tweet)
    tag_array = tweet.tags.split(",")
    puts "==="
    puts tag_array
    tag_array.each do |t|
      new_tag = Tag.create(content:t,
              parent_created_at:tweet.tweet_created_at,
              parent_tweet_id:tweet.id,
              parent_user_id:tweet.user_id)
      #puts new_tag.content
    end
    puts "==="
  end

  def self.test
    puts "this is a test"
  end

end