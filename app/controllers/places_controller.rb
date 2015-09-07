class PlacesController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create]

	# disabled for pagination
	#def index
	#	@places = Place.all
	#end

	# start added for pagination
	def index
		@places = Place.search(params[:search], params[:page])
	end
	# end added for pagination

	# PLEASE NOTE the variable in the new action is SINGULAR, ONE RECORD
	def new
		@place = Place.new
	end

	# Changing from Place.create(places_params) to allow for places as defined in user.rb
	def create
		current_user.places.create(place_params)
		redirect_to root_path
	end

	def show
		@place = Place.find(params[:id])
	end

	def edit
		@place = Place.find(params[:id])
	end

	def update
		@place = Place.find(params[:id])
		@place.update_attributes(place_params)
		redirect_to root_path
	end

	private

	def place_params
		params.require(:place).permit(:name, :description, :address)
	end

end