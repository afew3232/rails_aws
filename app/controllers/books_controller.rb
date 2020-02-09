class BooksController < ApplicationController
	def index
		@book = Book.new
		@users = User.all
		@books = Book.all
	end

	def new
	end

	def create
		@book = Book.new(post_book_params)
		@book.user_id = current_user.id
		@books = Book.all
			if @book.save
			redirect_to user_path(current_user.id)
		else
			render :index
		end
	end

	private
	def post_book_params
		params.require(:book).permit(:title,:body,:user_id)
		#これをすることで、よきせぬパラメータが入るのを防ぐ
		#例えばHTML側から :phonenumberが送られてきても、入らなくなる。
	end

end
