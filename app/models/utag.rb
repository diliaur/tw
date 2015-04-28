class Utag < ActiveRecord::Base

	validates :content, presence:true, uniqueness:true

	def popularity_score
		# test for zero values, which mess up calculations
		self.rt_count == 0 ? rt = 1 : rt = self.rt_count
		self.fav_count == 0 ? fv = 1 : fv = self.fav_count

		numerator = count + (fv * rt)
		denominator = (self.last_mention - self.first_mention) #to minutes

		denominator = 1 if denominator == 0 # watch for zero in denominator (BAD!)

		return (numerator/denominator)
	end

	def self.print_top (num)
		result = Utag.order(pop_score: :desc).limit(num)
		result.all.each do |r|
			puts "#{r.content}: C #{r.count}, R #{r.rt_count}, F #{r.fav_count}, P #{r.pop_score}"
		end
	end

	def self.print_all_pop
		self.all.each do |u|
			print "#{u.popularity_score},#{u.pop_score} -- "
		end
		return ""
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
