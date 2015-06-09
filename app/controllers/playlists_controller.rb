class PlaylistsController < ApplicationController

  before_filter :find_playlist, only: [:show, :edit, :update, :destroy]
  before_filter :find_user

  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = @user.playlists.new
  end

  def create
    @playlist = @user.playlists.new(params[:playlist])
    if @playlist.save
      flash[:notice] = I18n.t 'controllers.playlists.created'
      redirect_to user_playlists_path
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
      redirect_to user_playlist_path
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

private

  def find_playlist
    @playlist = Playlist.find(params[:id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
