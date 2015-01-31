class InternalPropertiesController < ApplicationController
layout "admin"

  def index
    @properties = InternalProperty.sorted
  end

  def show
     @property = InternalProperty.find(params[:id])
  end

  def new
     @users = User.order("first_name ASC")
     @property = InternalProperty.new
  end

  def create
    property = InternalProperty.new(property_params)
    if property.save
      if property_params[:image].present?
        property_params[:image].each do |i|
          photo = Photo.new(:image => i, :internal_property_id => property.id)
          photo.save
       end
      end
      flash[:notice] = 'New Property Created.'
      redirect_to(:action => 'index')
    else
      render("new")
    end
  end

    def edit
    @users = User.order("first_name ASC")
    @property = InternalProperty.find(params[:id])
    #@photos = @property.photos
    @photos = @property.photos.order(:position)
  end

  def update
    @property = InternalProperty.find(params[:id])
    if @property.update_attributes(property_params)
       if property_params[:image].present?
        property_params[:image].each do |i|
          photo = Photo.new(:image => i, :internal_property_id => @property.id)
          photo.save
       end
      end
      flash[:notice] = 'Property updated.'
      redirect_to(:action => 'index')
    else
      render("edit")
    end
  end

  def delete
    @property = InternalProperty.find(params[:id])
  end

  def destroy
    InternalProperty.find(params[:id]).destroy
    flash[:notice] = "Property Deleted"
    redirect_to(:action => 'index')
  end

  private

  def property_params
    params.require(:property).permit(:name, :price, :address, :description, :short_description, :user_id, image: [])
  end

end