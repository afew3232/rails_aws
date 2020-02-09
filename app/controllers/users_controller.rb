class UsersController < ApplicationController
	def root
	end

	def index
		@book = Book.new
		@users = User.all
		@books = Book.all
	end

	def show
		@book = Book.new
		@user = User.find(params[:id])
		@users = User.all
		@books = Book.all
	end

end
