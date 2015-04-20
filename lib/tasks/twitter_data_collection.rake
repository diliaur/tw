namespace :tw do

	# automatically get and save tweets, tags, users, using
	# methods written in lib/talking_to_twitter.rb
	# pull 100 (controlled in TalkingToTwitter class) every 5 minutes (controlled here)
	desc "Get tweets & restructure to fit models using lib methods"
	task get_twitter_data: :environment do # :environment dependency loads whole rails app
		tag = ENV['tag']
		puts "Getting data from twitter for tag #{tag}"
		TalkingToTwitter.load_tweets_by_tag(tag)
		puts "Done getting data from twitter."
	end

end