class TracksController < ApplicationController
  
  def index
    @tracks = Track.all
    render :index
  end
  
  def show
    @track = Track.find(params[:id])
    render :show
  end
  
  def new
    @album = Album.find(params[:album_id])
    render :new
  end
  
  def create
    @track = Track.new(params[:track])
    @track.lyrics = ugly_lyrics(@track.lyrics)
    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages.first
      render :new
    end
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    @track = Track.find(params[:id])
    @track.delete
    redirect_to album_tracks_url(@track.album)
  end
end
