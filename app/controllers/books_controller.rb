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
end
