# book.rb

class Book
  attr_accessor :title, :author, :description, :price, :publisher_id, :availability

  def initialize(title, author, description, price, publisher_id, availability)
    @title = title
    @author = author
    @description = description
    @price = price
    @publisher_id = publisher_id
    @availability = availability
  end

  def self.search_books
    puts 'Enter the *title or author* of the book you are ** searching ** for:'
    user_input = gets.chomp

    # Search in the local database
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

  def self.search_books_by_publisher
    puts 'Enter the *Publisher Name* of the book you are ** searching ** for:'

    publisher_name = gets.chomp
    results = SQLiteDatabase.new.fetch_books_by_publisher(publisher_name)

    if results.empty?
      puts "No books found from the publisher #{publisher_name}."
    else
      puts "Books from the publisher #{publisher_name}:"
      results.each do |book|
        puts "#{book.title} by #{book.author}"
      end
    end
  end


  def self.display_book_details
   puts 'Enter the *title* of the book you want to ** view **:'
    user_input = gets.chomp

    # Search for the book in the local database
    book = SQLiteDatabase.new.find_book_by_title(user_input)

    if book.nil?
      book_from_remote_catalog = Book.search_remote_catalog(user_input).first
      puts "\nBook #{user_input} is not in stock! \nthe store keeper has to look up catalogs provided by the publishers."
      
      if !book_from_remote_catalog.nil?
        puts "\n:Book Details:"
        puts "#{book_from_remote_catalog.title} by #{book_from_remote_catalog.author}" 
      else
        puts 'Book not found.'
      end
    else
      puts "Book Details:"
      puts "Title: #{book.title}"
      puts "Author: #{book.author}"
      puts "Description: #{book.description}"
      puts "Price: #{book.price}"
      puts "Availability: #{book.availability ? 'Available' : 'Out of stock'}"
    end
  end


  def self.search_remote_catalog(search_query)
    # For demo purposes, we'll use a hash to represent remote catalog data
    remote_catalog_data = {
      'book1' => { 'title' => 'Book1', 'author' => 'Author 1' },
      'book2' => { 'title' => ' Book2', 'author' => 'Author 2' },
      # Add more books as needed
    }

    # Simulate searching in the remote catalog
    remote_results = remote_catalog_data.values.select do |book_data|
      book_data['title'].include?(search_query) || book_data['author'].include?(search_query)
    end

    Book.parse_remote_results(remote_results)
  end

  def self.parse_remote_results(remote_catalog_results)
    # For demo purposes, we'll simply convert the hash data into Book objects
    remote_catalog_results.map do |book_data|
      Book.new(book_data['title'], book_data['author'], '', 10.0, 2, 1)
    end
  end

  def self.buy_a_book
   puts 'Enter the *title* of the book you want to ** buy **:'
    user_input = gets.chomp

    # Search for the book in the local database
    book = SQLiteDatabase.new.find_book_by_title(user_input)

    if book.nil?
      puts 'Book not found.'
    else
      puts "Book Details:"
      puts "#{book.title} by #{book.author}, Availability: #{book.availability ? 'Available' : 'Not Available'}"
             buy_option = Book.ask_user('Do you want to **buy this book?** (yes/no)').downcase
             Book.update_availability(book) if buy_option == 'yes' && book.availability
    end
  end

  def self.place_an_order
    puts 'Enter the *title* of the book you want to ** order **:'
     user_input = gets.chomp

     # Search for the book in the local database
     book = SQLiteDatabase.new.find_book_by_title(user_input)

     if book.nil?
       puts 'Book not found.'
     else
       puts "Book Details:"

       if book.availability != 1
          puts "#{book.title} by #{book.author}, Availability: #{book.availability ? 'Available' : 'Not Available'}"
              order_option = Book.ask_user('Do you want to **place an order for this book?** (yes/no)').downcase
          puts "#{book.title} by #{book.author}, Order has been placed!"
        else
            puts "#{book.title} by #{book.author}, Availability: #{book.availability ? 'Available' : 'Not Available'}"
        end
     end
  end

  def self.ask_user(prompt)
    print "#{prompt} "
    gets.chomp
  end


  def self.update_availability(book)
    # @connection.execute('UPDATE books SET availability = 0 WHERE id = ?', [book.id])
    puts "Book '#{book.title}' has been marked as Not Available."
  end
end

