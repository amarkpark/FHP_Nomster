class PlacesController < ApplicationController
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

	# Note the use of the singular variable "place" here to create one record
	def create
		Place.create(places_params)
		redirect_to root_path
	end

	def places_params
		params.require(:place).permit(:name, :description, :address)
	end

end