class StartFollowingMailer
  @queue = :start_follow_queue

  def self.perform(user_id)
    UserMailer.start_following(user_id).deliver
  end
end