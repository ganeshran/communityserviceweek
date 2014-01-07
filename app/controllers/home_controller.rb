class HomeController < ApplicationController
  def index
	  if signed_in?
		  redirect_to sw_interactions_path 
	  end
  end
end
