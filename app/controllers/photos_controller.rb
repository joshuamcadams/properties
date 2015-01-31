class PhotosController < ApplicationController


	def sort
		params[:photo].each_with_index do |id, index|
    	Photo.update(id, position: index+1)
  	end
		render nothing: true
	end

	def destroy
		photo = Photo.find(params[:id])
		prop_id = photo.internal_property_id
    photo.destroy
    flash[:notice] = "Photo Deleted"
    redirect_to(:controller => 'internal_properties', :action => 'edit', :id => prop_id)
  end



end