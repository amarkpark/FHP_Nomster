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

	def new
		@places = Place.new
	end

end
