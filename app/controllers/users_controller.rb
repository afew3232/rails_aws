class UsersController < ApplicationController
	def root
	end

	def index
	end

	def show
		@user = User.find(params[:id])
	end

end
