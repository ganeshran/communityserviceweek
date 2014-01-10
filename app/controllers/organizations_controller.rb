class OrganizationsController < ApplicationController
	before_action :signed_in_user, only: [:new, :edit, :show, :index]
	before_action :admin_user, only: [:edit, :new]
	def index
		@organizations = Organization.all
	end

	def show
	end

	def edit
	end

	def new 
	end

	private
	def admin_user
		redirect_to(root_url) and flash[:danger] = "You have to be an admin to perform this action" unless current_user.admin?
	end
end
