# book.rb

class Book
  attr_accessor :title, :author, :description, :price, :availability

  def initialize(title, author, description, price, availability)
    @title = title
    @author = author
    @description = description
    @price = price
    @availability = true
  end


  def matches_search_term?(term)
    # Check if the term matches any attribute of the book
    title.downcase.include?(term.downcase) || author.downcase.include?(term.downcase)
      # ... add other attributes as needed ...
  end
end

