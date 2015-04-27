module TagAggregation

	# count all tags and store unique 
	# if not unique update rt_count, fav_count, and last_mention datetime

	# Initial run is the worst, especially when have accumulated a large
	# amount of tags. Best to run this early and often.

	# TODO: rake task to run this either in conjunction with the tweet read-in or
	# some short time interval, like 10-15 min. Need to decide if want more real-time;
	# this would probably be no problem since it's not very computationally intensive
	# when run often.
	
	def self.update_tag_counts
		#puts Tag.all.first.content #ok so I CAN use models in other dirs
		unaggregated = Tag.where(is_agg:false)

		unaggregated.each do |u|
			#puts "+++++++++++"
			u_content = u.content.downcase! #content of tag
			if !u_content.blank? #checks for empties and nils
				#puts u_content
				parent = Tweet.find_by(id:u.parent_tweet_id) #parent tweet
				# create new utag; if it exists it'll return an object with all nil fields
				new_utag = Utag.create(content:u_content, #doesnt create if exists, for it must be unique
									   count:1,
									   rt_count:parent.retweet_count,
									   fav_count:parent.favorite_count,
									   first_mention:parent.tweet_created_at,
									   last_mention: parent.tweet_created_at) #for first recorded mention. later will update last_mention 
				if !new_utag.id.nil? == false#if utag exists already
					#dredge up utag
					#puts "------------------"
					#puts new_utag.content
					extant_utag = Utag.find_by(content:u_content) 
					#puts extant_utag
					#puts extant_utag.content
					#^^^find_by ok since should only be one record per unique content anyway

					# update its use count (++)
					new_use_count = extant_utag.count + 1
					extant_utag.update(count:new_use_count)
					# update rt count (add parent.retweet_count to current count (how?))
					new_rt_count  = extant_utag.rt_count  + parent.retweet_count
					extant_utag.update(rt_count:new_rt_count)
					# update fav count (add parent.favorite_count to current count (how?))
					new_fav_count = extant_utag.fav_count + parent.favorite_count
					extant_utag.update(fav_count:new_fav_count)
					# update last mention datetime (parent.tweet_created_at)
					extant_utag.update(last_mention:parent.tweet_created_at)
				end
				u.is_agg = true # update Tag is_agg flag (wow) --> true means processed
			end
		end
	end

end