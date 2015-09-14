class PhotosController < ApplicationController
	before_action :authenticate_user!
	def show
		@photos = Photo.all
	end

	def create
		@place = Place.find(params[:place_id])
		@place.photos.create(photo_params.merge(:user => current_user))
		redirect_to place_path(@place)
	end


	private

	def photo_params
		params.require(:photo).permit(:caption, :picture, :remote_picture_url)
	end
end
