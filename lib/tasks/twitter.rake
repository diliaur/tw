namespace :twitter_data_collection do

	# automatically get and save tweets, tags, users, using
	# methods written in lib/talking_to_twitter.rb
	desc "Get tweets & restructure to fit models using lib methods"
	rake get_twitter_data: :environment do # :environment dependency loads whole rails app
		puts "Getting data from twitter."

		puts "Done getting data from twitter."
	end

end