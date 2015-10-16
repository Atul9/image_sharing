class AlbumsController < ApplicationController
  def index
    @albums = Album.where(user: current_user)
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(album_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private
  def album_params
    params.require(:album).permit(:name, photos_attributes: [:image, :tag_line])
  end
end
