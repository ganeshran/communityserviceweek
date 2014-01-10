class OrganizationsController < ApplicationController
  def index
	  @organizations = Organization.all
  end

  def show
  end

  def edit
  end

  def new 
  end
end
