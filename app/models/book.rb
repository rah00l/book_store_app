class Book < ApplicationRecord

	belongs_to :publisher, optional: true
	

	def self.search(query)
	  where('author LIKE ? OR title LIKE ?', "%#{query}%", "%#{query}%")
	end

	def self.fetch_books_by_publisher(publisher_name)
		joins(:publisher).where('name LIKE ?', "%#{publisher_name}%")
	end
end
