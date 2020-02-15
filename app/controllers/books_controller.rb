class BooksController < ApplicationController
	before_action :authenticate_user!
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
		@book = Book.new #infoに自分のbook editを表示する。
		@book_show = Book.find(params[:id])
		@user = User.find(@book_show.user_id) #infoにも本の持ち主を表示する
		@users = User.all
	end

	def edit
		@book = Book.find(params[:id])
		if @book.user_id != current_user.id
			redirect_to books_path
		end
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:notice] = "You have updated book successfully."
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
