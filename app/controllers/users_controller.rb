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
		@user = User.find(params[:id])
		@users = User.all
		@books = Book.all
	end

	def edit
		@user = User.find(current_user.id)

	end
	def update
		@user = User.find(current_user.id)
		@user.update(user_params)
		redirect_to books_path
	end

	private
	def user_params
		#refileなので profile_imageの_idは抜く
		params.require(:user).permit(:name, :profile_image, :introduction)
	end
end
