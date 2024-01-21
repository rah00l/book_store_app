# app.rb
require 'byebug'

require_relative 'database/sqlite_database'
require_relative 'models/book'
require_relative 'models/publisher'

class BookStoreApp
  def initialize
    @database = SQLiteDatabase.new
    @database.setup
  end


  def run
    # Main application loop
    loop do
      puts "\n:::::::::: Book Store App :::::::::::"
      puts '1. Search for Books by Title or Author:'
      puts '2. Display Book Details:'
      puts '3. Buy a Book:'
      puts '4. Place an Order for Out-of-Stock Book:'
      puts '5. Search by Publisher:'
      puts '6. Exit'
      choice = gets.chomp.to_i

      case choice
      when 1
        # Implement the logic to add a book
        Book.search_books
      when 2
        Book.display_book_details  
      when 3
        Book.buy_a_book
      when 4
        Book.place_an_order
      when 5
        Book.search_books_by_publisher
      when 6
        puts 'Exiting the application.'
        break
      else
        puts 'Invalid choice. Please enter a valid option.'
      end
    end
  end
end



app = BookStoreApp.new
app.run

