module SessionsHelper

  def current_user?(user)
    user == current_user
  end

  def signed_in?
    !current_user.nil?
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to root_url, notice: "Please sign in."
    end
  end

  def store_location
    session[:return_to] = request.url
  end

end