class Tweet < ActiveRecord::Base
	#belongs_to :user
	#has_many :tags

	validates :content, presence: true
	validates :user_id, presence: true
	validates :tweet_created_at, presence: true
	validates :tweet_id, presence: true, uniqueness: true
	

	# is this too much? seriously
	def is_reply?
		this.is_reply
	end

	def is_retweet?
		this.is_retweet
	end

	# method: return tweets that are retweets
	# method: return tweets that are not retweets

	

	# query being tags
	def self.get_tweets_by_query(query = "")
	end

	def self.get_tweets_by_date_range(date="")
	end

	def self.get_tweets_by_query_and_date_range()
	end

	def self.print_all_asc_by_creation
		result = self.order(created_at: :asc)
		result.all.each do |r|
			puts "#{r.tweet_id} : #{r.content} @ #{r.created_at}"
		end
		return ""
	end

	# transform user_mentions into VNA format to be read into
	# gephi or other 
	# may not pay attention to weights eg multiple cnxns between nodes...
	def self.user_mentions_to_vna
		# open a file to write to?

		file = File.open("ferguson_discussion_replies.vna","w") do |f|
			# write first line
			f.write("*Node data\n")
			f.write("ID tags tweet_content\n")
			# grab all tweets that have user_mentions
			# tweets = Tweet.where("user_mentions is not null")
			
			#tweets = Tweet.where("user_mentions is not ? AND is_retweet = ?",nil,false) # >500
			# ^ grab all user_mentions WITHOUT retweets
			
			tweets = Tweet.where("user_mentions is not ? AND is_reply = ? AND is_retweet = ?",nil,true,false) #>200
			# ^ grab all user_mentions that are replies
			
			#tweets = Tweet.where("user_mentions is not ? AND is_reply is ? AND is_retweet = ?",
			#	nil,nil,false)
			#^ grab user_mentions were neither retweet nor reply
			
			#tweets = Tweet.where("user_mentions is not ? AND is_reply is ? and is_retweet = ?",nil,nil,true)
			# ^ grab user_mentions where is retweet only
			
			# for each tweet
			edges = ""
			tweets.all.each do |t|
				# user_screen_name is the originating node
				# add hash tags (string?) as attribute onto origin node
				f.write "#{t.user_screen_name} #{t.tags} \"#{t.content.gsub("\n","")}\"\n"
				# grab user_mentions field
				# for each user in user_mentions
				t.user_mentions.split(",").each do |um|
					# add a link from user_screen_name to the user
					#f.write("#{t.user_screen_name} #{um}\n")
					edges += "#{t.user_screen_name} #{um}\n"
				end
			end
			f.write("*Tie data\n")
			f.write(edges)

			# might have to separate up edge data and write it after all processing is finished
		end
	end

end
