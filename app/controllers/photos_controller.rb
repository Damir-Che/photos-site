class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params.merge(user_id:current_user.id))
    @photo.save
    redirect_to @photo
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update # отображает отредактированный пост
    @photo = Photo.find(params[:id])
    @photo.update_attributes(photo_params)
    redirect_to @photo
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_path #posts_path-ссылка
  end






  private

  def photo_params
    params.require(:photo).permit(:description)
  end

end
