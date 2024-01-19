require 'sqlite3'

class SQLiteDatabase
  def initialize
    @connection = SQLite3::Database.new('book_store.db')
    setup
  end

  def setup
    # Drop tables if they exist
    @connection.execute("DROP TABLE IF EXISTS books")
    @connection.execute("DROP TABLE IF EXISTS publishers")

    create_books_table
    create_publishers_table
    seed_data
  end

  def create_books_table
    @connection.execute(<<-SQL)
      CREATE TABLE IF NOT EXISTS books (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        author TEXT,
        description TEXT,
        price REAL,
        publisher_id INTEGER,
        availability BOOLEAN,
        FOREIGN KEY (publisher_id) REFERENCES publishers(id)
      );
    SQL
  end

  def create_publishers_table
    @connection.execute(<<-SQL)
      CREATE TABLE IF NOT EXISTS publishers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        catalog_home TEXT,
        catalog_search TEXT
      );
    SQL
  end

    def fetch_books(input)
      query = "SELECT * FROM books WHERE 1=1 AND (title LIKE ? OR author LIKE ?)"
      params = ["%#{input}%", "%#{input}%"]
      @connection.execute(query, params).map { |row| Book.new(*row[1..-1]) }
    end

    def fetch_books_by_publisher(publisher_name)
      query = <<~SQL
        SELECT * FROM books
        WHERE publisher_id IN (SELECT id FROM publishers WHERE name LIKE ?)
      SQL

      params = ["%#{publisher_name}%"]

      @connection.execute(query, params).map do |row|
        Book.new(*row[1..-1])
      end
    end

    def find_book_by_title(title)
      query = "SELECT * FROM books WHERE title LIKE ? LIMIT 1"
      params = ["%#{title}%"]

      result = @connection.execute(query, params).first

      if result.nil?
        nil
      else
        Book.new(*result[1..-1])
      end
    end


  def seed_data
    # Seed data for books
    @connection.execute(<<-SQL)
      INSERT INTO books (title, author, description, price, publisher_id, availability)
      VALUES ('Ruby Basics', 'John Doe', 'A guide to Ruby programming', 29.99, 1, 1),
             ('Web Development', 'Jane Smith', 'Building web applications with Ruby on Rails', 39.99, 2, 0);
    SQL

    # Seed data for publishers
    @connection.execute(<<-SQL)
      INSERT INTO publishers (name, catalog_home, catalog_search)
      VALUES ('Publisher1', 'http://publisher1.com', 'http://publisher1.com/search?q='),
             ('Publisher2', 'http://publisher2.com', 'http://publisher2.com/search?q='),
             ('Publisher3', 'http://publisher3.com', 'http://publisher3.com/search?q=');

    SQL
  end
end
