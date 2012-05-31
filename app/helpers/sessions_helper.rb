module SessionsHelper
  def current_user
    if session[:user_id]
      @user ||= User.find_by_id(session[:user_id])
    else
      nil
    end
  end

  def signed_in?
    !(current_user.nil?)
  end

  def requires_login
    if (!signed_in?) #If user is signed out
      session[:url] = request.url
      redirect_to signin_url, notice: request.path == '/' ?  nil : "Must be logged in to view this page!"
      # redirect_to signin_url, notice: "Must be logged in to view this page!"
    else
      current_user
    end
  end

  # Thanks sorcery.
  #
  # used when a user tries to access a page while logged out, is asked to login,
  # and we want to return him back to the page he originally wanted.
  def redirect_back_or_to(url, flash_hash = {})
    redirect_to(session[:url] || url, :flash => flash_hash)
    session[:url] = nil
  end

  def signin_signout_url
    if signed_in?
      return ['Log Out', signout_url]
    else
      ['Log In', signin_url]
    end
  end
  #helper_method :current_user, :signed_in?, :requires_login, :redirect_back_or_to
end