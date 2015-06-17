class SongsController < ApplicationController

  before_filter :find_song, :only => [:edit, :update, :destroy, :comments]

  def index
    @songs = Song.search params[:search], :page => params[:page], :per_page => 30
  end

  def upload
    @song = Song.create(params[:song])
    @song.user_id = current_user.id
    if @song.save
      binding.pry
      current_user.followed_users.each do |follower|
        UserMailer.notify_followers(follower, @song).deliver
      end
      render :action => 'edit'
    else
      flash[:alert] = I18n.t 'controllers.songs.not_uploaded'
    end
  end

  def edit
  end

  def update
    @song.update_attributes!(params[:song]) if @song.changed?
    flash[:notice] = I18n.t 'controllers.songs.uploaded'
    redirect_to(:controller => 'songs', :action => 'index')
  rescue
    flash[:alert] = I18n.t 'controllers.songs.not_uploaded'
    render 'users/show'
  end

  def destroy
    if @song
      @song.destroy
      flash[:notice] = I18n.t 'controllers.songs.destroyed'
    else
      flash[:alert] = I18n.t 'controllers.songs.not_destroyed'
    end
    redirect_to(:controller => 'songs', :action => 'index')
  end

  def comments
  end

  private

  def find_song
    @song = Song.find(params[:id])
  end
end
