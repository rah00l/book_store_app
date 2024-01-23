class Book < ApplicationRecord

	belongs_to :publisher
	def self.search(query)
	  where('author LIKE ? OR title LIKE ?', "%#{query}%", "%#{query}%")
	end
end
