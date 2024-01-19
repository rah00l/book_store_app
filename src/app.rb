# app.rb
require 'byebug'

require_relative 'models/book'
require_relative 'models/customer'
# require_relative 'database/local_database'
require_relative 'database/sqlite_database'

# Create instances
book1 = Book.new('Ruby Basics', 'John Doe', 'A guide to Ruby programming', 29.99, 0)
book2 = Book.new('Web Development', 'Jane Smith', 'Building web applications with Ruby on Rails', 39.99, 0)
customer = Customer.new('Alice', '123 Main St', 'alice@example.com')

# Initialize local database
# local_database = LocalDatabase.new
# local_database.add_book(book1)
# local_database.add_book(book2)

# Initialize SQLite database
sqlite_database = SQLiteDatabase.new
sqlite_database.add_book(book1)
sqlite_database.add_book(book2)

# def search_books(database, search_term)
#   books = database.search_books(search_term)
#   display_books(books)
# end

def display_books(books)
  puts "Search Results:"
  books.each do |book|
    puts "#{book.title} by #{book.author}"
  end
end

# search_books(sqlite_database, "Ruby")

def search_books
  puts 'Enter the title or author of the book you are searching for:'
  user_input = gets.chomp

  # Search in the local database
  # results = SQLiteDatabase.new.fetch_books(title: title_input, author: author_input)
  results = SQLiteDatabase.new.fetch_books(user_input)

  if results.empty?
    puts 'No matching books found.'
  else
    puts 'Matching books:'
    results.each do |book|
      puts "#{book.title} by #{book.author}"
    end
  end
end

# puts "Local Database Books: #{local_database.books.map(&:title).join(', ')}"
# puts "SQLite Database Books: #{sqlite_database.fetch_books.map(&:title).join(', ')}"

# Main application loop
loop do
  puts '1. Add Book'
  puts '2. Search Books'
  puts '3. Exit'
  choice = gets.chomp.to_i

  case choice
  when 1
    # Implement the logic to add a book
  when 2
    search_books
  when 3
    puts 'Exiting the application.'
    break
  else
    puts 'Invalid choice. Please enter a valid option.'
  end
end



