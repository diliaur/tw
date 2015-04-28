class Utag < ActiveRecord::Base

	validates :content, presence:true, uniqueness:true

	def frequency # should this be the name? :/
		return this.count
	end


	def self.return_all
		self.all.each do |u|
			puts "#{u.content} (C:#{u.count},R:#{u.rt_count},F:#{u.fav_count}) -- "
		end
		return ""
	end
end
