class OrganizationsController < ApplicationController
	before_action :set_organization, only: [:show, :edit, :destroy]
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
		@organization = Organization.new
	end

	# DELETE /sw_interactions/1
	# DELETE /sw_interactions/1.json
	def destroy
		@other_id = Organization.where(:name => 'Other Institutes').first
		@organization.sw_interactions.update_all(:organization_id => @other_id)
		@organization.destroy
		respond_to do |format|
			format.html { redirect_to organizations_url}
			format.json { head :no_content }
		end
	end

	
	# Use callbacks to share common setup or constraints between actions.
	def set_organization
		@organization = Organization.find(params[:id])
		redirect_to organizations_url and flash[:danger] = "You cannot edit/delete this record" if @organization.name == "Other Institutes"
	end
	
	private
	def admin_user
		redirect_to(root_url) and flash[:danger] = "You have to be an admin to perform this action" unless current_user.admin?
	end
end
