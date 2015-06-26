class UsersController < ApplicationController

  before_filter :find_user, except: [:index]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @playlists = Playlist.paginate(page: params[:page])
    @users = User.all
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = I18n.t 'controllers.users.updated'
      redirect_to user_path
    else
      flash[:alert] = I18n.t 'controllers.users.not_updated'
      render :edit
    end
  end

  def following
    @users = @user.followed_users
  end

  def followers
    @users = @user.followers
  end

private

  def find_user
    @user = User.find(params[:id])
  end
end