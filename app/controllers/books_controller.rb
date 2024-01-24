class BooksController < ApplicationController
	def index
		if params[:query].present?
			@books = Book.search(params[:query])	
		else
			@books = Book.all
		end

		respond_to do |format|
			format.html
		end
	end

	def show
		@book = Book.find(params[:id])
	end

	def search_by_publisher
		@books = Book.fetch_books_by_publisher(params[:publisher_name])
		render :index
	end

	def buy
		@book = Book.find(params[:id])

		if @book.availability?
			# Book is available, perform purchase logic here
			# For example, you might update the availability status and create a purchase record
			@book.update(availability: false)
			# Adjust this based on your user system, this is secondary lets not consider it.
			# Purchase.create(book: @book, customer: current_user)  
			flash[:success] = "Book purchased successfully!"
		else
			flash[:alert] = "Sorry, this book is not available for purchase."
		end

		redirect_to @book
	end
end
