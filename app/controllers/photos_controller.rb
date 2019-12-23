class PhotosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :owner, only: : [:edit, :update, :update]


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

  def update
    @photo = Photo.find(params[:id])
    @photo.update_attributes(photo_params)
    redirect_to @photo
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_path
  end






  private

  def photo_params
    params.require(:photo).permit(:description)
  end

  # def owner
  #   @photo = current_user.photos.find(params[:id])
  #   redirect_to photos_path, notice: 'У вас нет разрешения на изменения фотограии'
  # end
end
