class PlaylistsController < ApplicationController

  before_filter :find_playlist, except: [:index, :new, :create]
  before_filter :find_song, :only => [:add_song]

  def index
    @playlists = Playlist.paginate(page: params[:page])
    @song = params[:song_id]
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(params[:playlist])
    @playlist.user = current_user
    if @playlist.save
      flash[:notice] = I18n.t 'controllers.playlists.created'
      redirect_to playlists_path
    else
      flash[:alert] = I18n.t 'controllers.playlists.not_created'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @playlist.update_attributes(params[:playlist])
      flash[:notice] = I18n.t 'controllers.playlists.updated'
      redirect_to playlist_path
    else
      flash[:alert] = I18n.t 'controllers.playlists.not_updated'
      render :edit
    end
  end

  def destroy
    if @playlist
      @playlist.destroy
      flash[:notice] = I18n.t 'controllers.playlists.destroyed'
    else
      flash[:alert] = I18n.t 'controllers.playlists.not_destroyed'
    end
    redirect_to(:controller => 'playlists', :action => 'index')
  end

  def add_song
    @playlist.songs << @song
    if @playlist.save
      flash[:notice] = I18n.t 'controllers.playlists.updated'
      redirect_to playlist_path(@playlist)
    else
      flash[:alert] = I18n.t 'controllers.playlists.not_updated'
      redirect_to songs_path
    end
  end

private

  def find_playlist
    @playlist = Playlist.find(params[:id])
  end

  def find_song
    @song = Song.find(params[:song_id])
  end
end
