class AlbumsController < ApplicationController
  before_filter :set_album, only: [:show, :edit, :update, :destroy]

  def index
    @albums = current_user.albums
  end

  def new
    @album = Album.new
    @album.photos.build
  end

  def create
    @album = current_user.albums.new(album_params)
    if @album.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @album.update_attributes(album_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def show
  end

  private
    def album_params
      params.require(:album).permit(:name, photos_attributes: [:id, :image, :tag_line])
    end

    def set_album
      @album = Album.find(params[:id])
    end
end
