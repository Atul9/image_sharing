class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  def index
    @albums = current_user.albums
  end

  def new
    @album = Album.new
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

  def show
  end

  def update
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

    def set_album
      @album = Album.where(id: params[:id]).first
    end
end
