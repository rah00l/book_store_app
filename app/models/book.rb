class Book < ApplicationRecord
	def self.search(query)
	  where('author LIKE ? OR title LIKE ?', "%#{query}%", "%#{query}%")
	end
end
