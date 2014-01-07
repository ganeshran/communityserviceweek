class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_back_or sw_interactions_path 
		else
			flash[:error] = 'Invalid email/password combination' # Not quite right!
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to signin_path 
	end

end