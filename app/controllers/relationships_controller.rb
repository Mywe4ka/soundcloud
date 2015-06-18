class RelationshipsController < ApplicationController
  include MailSendingLogic

  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    user_id = current_user.id
    Resque.enqueue(StartFollowingMailer, user_id)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    user_id = current_user.id
    Resque.enqueue(StopFollowingMailer, user_id)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end