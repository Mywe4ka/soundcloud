class NotifyMailer
  @queue = :notify_queue

  def self.perform(user_ids, song_id)
    UserMailer.notify_followers(user_ids, song_id).deliver
  end

end