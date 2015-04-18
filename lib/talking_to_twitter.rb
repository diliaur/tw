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
      print "[#{count}] #{r.text} ; TAGS: ["
      hashtags = ""
      r.hashtags.each do |h| #wanna change this to cre8 tag string to add to Tweet model (as hashtags are strings currently)
        hashtags += "#{h.text},"
      end
      print hashtags
      print "]; #{r.created_at} \n"
      count = count + 1
      puts count
      #create Tweet object
      new_tweet = Tweet.create(content:r.text,
                               user_id:r.user.screen_name,
                               #tweet_id:r.id, #may need :limit or something, big number
                               tweet_created_at:r.created_at)
      if new_tweet.valid?
        puts "tweet stored"
      else
        puts "ERROR: tweet not stored"
      end

      puts "---"
    end
    puts "number of tweets: #{count}"
  end

  def self.test
    puts "this is a test"
  end

end