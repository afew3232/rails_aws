class UsersController < ApplicationController
	def root
	end

	def index
		@book = Book.new
		@user = User.find(current_user.id)
		@users = User.all
		@books = Book.all
	end

	def show
		@book = Book.new
		@user = User.find(current_user.id)
		@users = User.all
		@books = Book.all
	end

	def edit
		@user = User.find(params[:id])

	end
	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to books_path
	end

	private
	def user_params
		params.require(:user).permit(:name, :introduction)
	end
end
