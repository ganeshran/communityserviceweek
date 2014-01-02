class SwInteractionsController < ApplicationController
	before_action :set_sw_interaction, only: [:show, :edit, :update, :destroy]

	# GET /sw_interactions
	# GET /sw_interactions.json
	def index
		@sw_interactions = SwInteraction.all
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
		@sw_interaction = SwInteraction.new(sw_interaction_params)

		respond_to do |format|
			if @sw_interaction.save
				format.html { redirect_to @sw_interaction, notice: 'Sw interaction was successfully created.' }
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
				format.html { redirect_to @sw_interaction, notice: 'Sw interaction was successfully updated.' }
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

	private
	def sw_interaction_params
		params.permit(:organization, :volunteerHours, :category)
	end

end
