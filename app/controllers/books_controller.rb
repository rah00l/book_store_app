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

end
