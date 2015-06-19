module MailSendingLogic
  def start_follow(current_user)
    UserMailer.start_following(current_user).deliver
  end

  def stop_follow(current_user)
    UserMailer.stop_following(current_user).deliver
  end

  def notify_follow(current_user, song)
    current_user.followed_users.each do |follower|
      UserMailer.notify_followers(follower, song).deliver
    end
  end
end