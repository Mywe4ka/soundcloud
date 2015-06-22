class RelationshipsController < ApplicationController
  include MailSendingLogic

  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    @user.user_status
    Resque.enqueue(StartFollowingMailer, current_user.id)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    @user.user_status
    Resque.enqueue(StopFollowingMailer, current_user.id)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end