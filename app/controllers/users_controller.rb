class UsersController < ApplicationController
  before_filter :find_user, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to user_path }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

private

  def find_user
    @user = User.find(params[:id])
  end
end