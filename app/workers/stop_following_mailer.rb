class StopFollowingMailer
  @queue = :stop_follow_queue

  def self.perform(user_id)
    UserMailer.stop_following(user_id).deliver
  end
end