# sqlite_database.rb

require 'sqlite3'

class SQLiteDatabase
  attr_accessor :connection

  def initialize
    @connection = SQLite3::Database.new('book_store.db')
    create_tables
  end

  def create_tables
    @connection.execute <<-SQL
      CREATE TABLE IF NOT EXISTS books (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        author TEXT,
        description TEXT,
        price REAL,
        availability INTEGER
      );
  end

  def add_book(book)
    @connection.execute(
      'INSERT INTO books (title, author, description, price, availability) VALUES (?, ?, ?, ?, ?)',
      [book.title, book.author, book.description, book.price, book.availability ? 1 : 0]
    )
  end

  # def fetch_books
  #   result = @connection.execute('SELECT * FROM books')
  #   result.map { |row| Book.new(*row[1..-1]) }
  # end

  # def fetch_books(params)
  #   query = 'SELECT * FROM books WHERE 1=1'

  #   debugger
  #   # Add conditions for title and author if provided
  #   if params[:title]
  #     query += " AND title LIKE ?"
  #     title_param = "%#{params[:title]}%"
  #   end

  #   if params[:author]
  #     query += " AND author LIKE ?"
  #     author_param = "%#{params[:author]}%"
  #   end

  #   # Construct the parameters array
  #   params_array = [title_param, author_param].compact

  #   debugger
  #   @connection.execute(query, params_array).map { |row| Book.new(*row[1..-1]) }
  # end

  def fetch_books(input)
    query = "SELECT * FROM books WHERE 1=1 AND (title LIKE ? OR author LIKE ?)"
    params = ["%#{input}%", "%#{input}%"]

    @connection.execute(query, params).map { |row| Book.new(*row[1..-1]) }
  end


  # def search_books(search_term)
  #   fetch_books.select { |book| book.matches_search_term?(search_term) }
  # end
end
