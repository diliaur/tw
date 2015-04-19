class User < ActiveRecord::Base
	has_many :tweets
	has_many :tags

	validates :user_id, presence: true,
	                    uniqueness: true
	validates :screen_name, presence: true,
	                        uniqueness: true
end
