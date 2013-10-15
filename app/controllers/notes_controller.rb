class NotesController < ApplicationController
  
  def index
    @notes = Note.all
    render :index
  end
  
  def show
    @note = Note.find(params[:id])    
    render :show
  end
  
  def create
    # params[:note][:track_id] = params[:track_id]
    # @note = Note.new(params[:note])
    @track = Track.find(params[:track_id])
    @note = @track.notes.build(params[:note])
    if @note.save
      redirect_to track_url(@note.track)
    else
      flash.now[:errors] = @note.errors.full_messages.first
      render 'tracks/show'
    end
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    @note = Note.find(params[:id])
    @note.delete
    redirect_to tracks_url(@note.track)
  end
end
