class Utag < ActiveRecord::Base

	validates :content, presence:true, uniqueness:true

	def popularity_score
		numerator = (self.count + (self.rt_count * self.fav_count))
		denominator = self.last_mention - self.first_mention
		return (numerator/denominator)
	end

	def self.print_all
		self.all.each do |u|
			puts "#{u.content} (C:#{u.count},R:#{u.rt_count},F:#{u.fav_count}) -- "
		end
		return ""
	end

	def self.print_newest
		result = self.order(created_at: :desc)
		result.all.each do |r|
			puts "#{r.content} created at #{r.created_at.to_time}"
		end
		return ""
	end


end
