class BooksController < ApplicationController
	def index
		@book = Book.new
		@user = User.find(current_user.id)
		@users = User.all
		@books = Book.all
	end

	def new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			flash[:notice] = "You have created book successfully."
			redirect_to book_path(@book.id)
		else
			@books = Book.all
			@users = User.all
			@user = User.find(current_user.id)
			render :index
		end
	end

	def show
		@book = Book.new
		@user = User.find(current_user.id)
		@users = User.all
		@book_show = Book.find(params[:id])
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:notice] = "succssfully"
			redirect_to book_path()
		else
			render :edit
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	private
	def book_params
		params.require(:book).permit(:title,:body,:user_id)
		#これをすることで、よきせぬパラメータが入るのを防ぐ
		#例えばHTML側から :phonenumberが送られてきても、入らなくなる。
	end

end
