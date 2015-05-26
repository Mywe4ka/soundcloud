class SongsController < ApplicationController

  before_filter :find_song, :only => [:edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def upload
    @song = Song.create(params[:song])
    @song.user_id = current_user.id
    if @song.save
      render :action => 'edit'
    else
      render :text => "File can't be uploaded"
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if ((@song.changed? && @song.update_attributes(params[:song])) || !@song.changed?)
        format.html {
          flash[:notice] = 'You have successfully uploaded song!'
          redirect_to(:controller => 'songs', :action => 'index')
        }
      else
        format.html {
          flash[:alert] =  'Song was not uploaded!'
          render 'users/show'
        }
      end
    end
  end

  def destroy
  end

  private

  def find_song
    @song = Song.find(params[:id])
  end
end
