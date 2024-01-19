# local_database.rb

class LocalDatabase
  attr_accessor :books

  def initialize
    @books = []
  end

  def add_book(book)
    @books << book
  end
end
