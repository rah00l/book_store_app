require 'minitest/autorun'
require_relative '../src/models/book'
require_relative '../src/database/sqlite_database'
require 'minitest/mock'
require 'byebug'

class BookTest < Minitest::Test
  def setup
    # Create a mock for SQLiteDatabase
    @sqlite_database_mock = Minitest::Mock.new
    # Stub the fetch_books method to return a sample result
    @sample_book = Book.new('Sample Title', 'Sample Author', 'Sample Description', 29.99, 1, true)
  end

  def test_search_books
    puts "\n\nRunning test: test_search_books_found, Expected input: 'ruby'"
    @sqlite_database_mock.expect(:fetch_books, [@sample_book], ['ruby'])

    # Stub the new method to return the mock
    SQLiteDatabase.stub(:new, @sqlite_database_mock) do
      # Perform the test
      results = Book.search_books

      # Assertions
      assert_equal [@sample_book], results
    end

    # Verify that the fetch_books method was called with the expected arguments
    assert_mock @sqlite_database_mock
  end

  def test_search_books_not_found
    puts "\n\nRunning test: test_search_books_found, Expected input: 'blank'"
    # Set expectations on the mock for fetch_books returning an empty array
    @sqlite_database_mock.expect(:fetch_books, [], ['blank'])

    # Stub the new method to return the mock
    SQLiteDatabase.stub(:new, @sqlite_database_mock) do
      # Perform the test
      results = Book.search_books

      # Assertions
      assert_nil results
    end

    # Verify that the fetch_books method was called with the expected arguments
    assert_mock @sqlite_database_mock
  end

  def test_display_book_details
    puts "\n\nRunning test: test_display_book_details, Expected input: 'ruby'"
    # Set expectations on the mock for find_book_by_title
    @sqlite_database_mock.expect(:find_book_by_title, @sample_book, ['ruby'])

    # Stub the new method to return the mock
    SQLiteDatabase.stub(:new, @sqlite_database_mock) do
      # Perform the test
      Book.display_book_details
    end

    # Verify that the find_book_by_title method was called with the expected arguments
    assert_mock @sqlite_database_mock
  end

  def test_display_book_details_not_found
    puts "\n\nRunning test: test_display_book_details_not_found, Expected input: 'blank'"
    # Set expectations on the mock for find_book_by_title
    @sqlite_database_mock.expect(:find_book_by_title, nil, ['blank'])

    # Stub the new method to return the mock
    SQLiteDatabase.stub(:new, @sqlite_database_mock) do
      # Perform the test
      result = Book.display_book_details

      # Assertions
      assert_nil result
    end



    # Verify that the find_book_by_title method was called with the expected arguments
    assert_mock @sqlite_database_mock
  end


  def test_search_books_by_publisher
    puts "\n\nRunning test: test_search_books_by_publisher, Expected input: 'pub1'"
    @sqlite_database_mock.expect(:fetch_books_by_publisher, [@sample_book], ['pub1'])

    # Stub the new method to return the mock
    SQLiteDatabase.stub(:new, @sqlite_database_mock) do
      # Perform the test
      results = Book.search_books_by_publisher

    end

    # Verify that the fetch_books_by_publisher method was called with the expected arguments
    assert_mock @sqlite_database_mock    
  end

  def test_search_books_by_publisher_not_found
    puts "\n\nRunning test: test_search_books_by_publisher_not_found, Expected input: should be 'blank'"
    @sqlite_database_mock.expect(:fetch_books_by_publisher, [], ['blank'])

    # Stub the new method to return the mock
    SQLiteDatabase.stub(:new, @sqlite_database_mock) do
      # Perform the test
      results = Book.search_books_by_publisher

      # Assertions
      assert_nil results
    end

    # Verify that the fetch_books_by_publisher method was called with the expected arguments
    assert_mock @sqlite_database_mock    
  end

  def test_buy_a_book
    puts "\n\nRunning test: test_buy_a_book, Expected input: 'ruby'"
    # Set expectations on the mock for find_book_by_title
    @sqlite_database_mock.expect(:find_book_by_title, @sample_book, ['ruby'])

    # Stub the new method to return the mock
    SQLiteDatabase.stub(:new, @sqlite_database_mock) do
      # Perform the test
      Book.buy_a_book
    end

    # Verify that the find_book_by_title method was called with the expected arguments
    assert_mock @sqlite_database_mock
  end

  def test_place_an_order
    puts "\n\nRunning test: test_place_an_order, Expected input: 'ruby'"
    # Set expectations on the mock for find_book_by_title
    @sqlite_database_mock.expect(:find_book_by_title, @sample_book, ['ruby'])

    # Stub the new method to return the mock
    SQLiteDatabase.stub(:new, @sqlite_database_mock) do
      # Perform the test
      Book.buy_a_book
    end

    # Verify that the find_book_by_title method was called with the expected arguments
    assert_mock @sqlite_database_mock
  end
end
