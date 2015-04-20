class User < ActiveRecord::Base
	#has_many :tweets
	#has_many :tags

#	validates :user_id, presence: true,
#	                    uniqueness: true
# no longer using user_id from twitter, it's too big for int.
# use internal db id instead

	validates :screen_name, presence: true,
	                        uniqueness: true
end
