module TagAggregation

	# count all tags and store unique 
	# if not unique update count(s) as well as other info
	# start from ground up? or if have Tag passed in, can simply add count... 
	#   but don't want to overcount. if anytime tag is passed in, it will update...
	#   so need to periodically empty all and recount? seems ridiculous...
	# use hash map?
	# need some way to check if that PARTICULAR TAG has already been counted.
	def self.update_tag_counts
		#puts Tag.all.first.content #ok so I CAN use models in other dirs
		Tag.all.each do |t|
			new_utag = Utag.create(content:t.content) #doesnt create if exists
			if !new_utag.nil?
				# update 
			end
		end
	end
end