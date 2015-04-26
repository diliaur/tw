module TagAggregation

	# count all tags and store unique 
	def self.update_tag_counts
		puts Tag.all.first.content #ok so I CAN use models in other dirs
	end
end