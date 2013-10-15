class AlbumsController < ApplicationController
  
  def index
    render :index
  end
  
  def show
    @album = Album.find(params[:id])
    render :show
  end
  
  def new
    @album = Album.new
    render :new
  end
  
  def create
    @album = Album.new(params[:album])
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages.first
      render :new
    end
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    @album = Album.find(params[:id])
    @album.delete
    redirect_to band_albums_url(@album.band)
  end
end
