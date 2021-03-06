require './lib/talking_to_twitter.rb'
require './lib/tag_aggregation.rb'

namespace :tw do

	# automatically get and save tweets, tags, users, using
	# methods written in lib/talking_to_twitter.rb
	# pull 100 (controlled in TalkingToTwitter class) every 5 minutes (controlled here)
	desc "Get tweets & restructure to fit models using lib methods"
	task get_twitter_data: :environment do # :environment dependency loads whole rails app
		tag = "#ferguson" #ENV['tag']
		puts "Getting data from twitter for tag #{tag}"
		TalkingToTwitter.load_tweets_by_tag(tag)
		puts "Done getting data from twitter."

		# TO ADD: probably want to puts data into a log
	end

	desc "Updates counts on Utags (unique tags)"
	task update_utag_counts: :environment do
		TagAggregation.update_tag_counts
	end

end

namespace :internal do

	desc "Update popularity scores on each Utag (every 15 min)"
	task update_pop_scores: :environment do
		Utag.update_pop_scores
		Utag.print_top 10
	end

end