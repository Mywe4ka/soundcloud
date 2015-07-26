class NotifyMailer
  @queue = :notify_queue

  def self.perform(user_ids, song_id)
    user_ids.each do |user_id|
      UserMailer.notify_followers(user_id, song_id).deliver
    end
  end

end