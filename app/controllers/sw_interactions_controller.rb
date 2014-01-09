class SwInteractionsController < ApplicationController
	before_action :set_sw_interaction, only: [:show]
  	before_action :correct_user, only:  [:edit, :update, :destroy]
	before_action :signed_in_user, only: [:new, :edit, :update, :index]

	# GET /sw_interactions
	# GET /sw_interactions.json
	def index
		@sw_interactions = current_user.sw_interactions.all
	end

	# GET /sw_interactions/1
	# GET /sw_interactions/1.json
	def show
	end

	# GET /sw_interactions/new
	def new
		@sw_interaction = SwInteraction.new
	end

	# GET /sw_interactions/1/edit
	def edit
	end

	# POST /sw_interactions
	# POST /sw_interactions.json
	def create
		puts sw_interaction_params.inspect
		@sw_interaction = current_user.sw_interactions.build(sw_interaction_params)
		#		@sw_interaction = SwInteraction.new(sw_interaction_params)

		respond_to do |format|
			if @sw_interaction.save
				flash[:success] = 'Activity was successfully logged' 
				format.html { redirect_to @sw_interaction }
				format.json { render action: 'show', status: :created, location: @sw_interaction }
			else
				format.html { render action: 'new' }
				format.json { render json: @sw_interaction.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /sw_interactions/1
	# PATCH/PUT /sw_interactions/1.json
	def update
		respond_to do |format|
			if @sw_interaction.update(sw_interaction_params)
				flash[:success] = "Activity was successfully updated" 
				format.html { redirect_to @sw_interaction }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @sw_interaction.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /sw_interactions/1
	# DELETE /sw_interactions/1.json
	def destroy
		@sw_interaction.destroy
		respond_to do |format|
			format.html { redirect_to sw_interactions_url }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_sw_interaction
		@sw_interaction = SwInteraction.find(params[:id])
	end

	def correct_user
		@sw_interaction = current_user.sw_interactions.find_by(id: params[:id])
		redirect_to root_url and flash[:danger] = "You cannot edit this record because it was created by someone else" if @sw_interaction.nil?
	end

	private
	def sw_interaction_params
		params.require(:sw_interaction).permit(:organization_id, :volunteerHours, :category, :fromactivitydate, :toactivitydate)
	end

	def signed_in_user
		unless signed_in?
			store_location
			flash[:danger] = "Please sign in to access this page"
			redirect_to signin_url
		end
	end


end
