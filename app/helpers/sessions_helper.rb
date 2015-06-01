module SessionsHelper

  def current_user?(user)
    user == current_user
  end

  def signed_in?
    !current_user.nil?
  end

end