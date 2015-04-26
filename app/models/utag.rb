class Utag < ActiveRecord::Base

	validates :content, presence:true, uniqueness:true

	def frequency_score
		# number of times used, in a given period
		# how to give: high score for higher count and shorter period
		#   count/period OK?
	end

	#others?
end
