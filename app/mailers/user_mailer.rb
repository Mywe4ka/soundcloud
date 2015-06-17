class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def start_following(user)
    @user = user
    mail(to: user.email,
         subject: "Starting following new user")
  end

  def stop_following(user)
    @user = user
    mail(to: user.email,
         subject: "Stopping following the user")
  end

  def notify_followers(user, song)
    @user = user
    @song_id = song.id
    mail(to: user.email,
         subject: "Following user added new song")
  end
end
