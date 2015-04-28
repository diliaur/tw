class Tag < ActiveRecord::Base
	#belongs_to :user
	#belongs_to :tweet

	validates :content, presence: true
	validates :parent_created_at, presence: true
	validates :parent_tweet_id, presence: true
	validates :parent_user_id, presence: true

	# how many users have used a tag
	def self.users_per_tag (tag)
		#find all Tags with content '#tag'
		#iterate thru each, collecting users
		
	end

	def self.all_aggregated
		return self.where(is_agg:true)
	end

	def self.all_unaggregated
		return self.where(is_agg:false)
	end

	def self.return_all
		self.all.each do |u|
			puts "#{u.content} -- "
		end
		return ""
	end

	def self.return_all_asc_by_creation
		result = self.order(created_at: :asc)
		result.all.each do |r|
			print "#{r.content} @ #{r.created_at} -- "
		end
		return ""
	end
end
