class RelationshipsController < ApplicationController
  include MailSendingLogic

  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    User.user_status(@user)
    Resque.enqueue(StartFollowingMailer, current_user.id)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    User.user_status(@user)
    Resque.enqueue(StopFollowingMailer, current_user.id)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end