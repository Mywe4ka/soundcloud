class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def start_following(user_id)
    @user = User.find(user_id)
    mail(to: @user.email,
         subject: "Starting following new user")
  end

  def stop_following(user_id)
    @user = User.find(user_id)
    mail(to: @user.email,
         subject: "Stopping following the user")
  end

  def notify_followers(user_id, song_id)
    @song = Song.find(song_id)
    @user = User.find(user_id)
    mail(to: @user.email,
          subject: "Following user added new song")
  end
end
