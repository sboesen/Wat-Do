module SessionsHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def requires_login
    if (!signed_in? && session[:url].nil?) #If user is signed out and the url is nil...
      redirect_to signin_url
    else
      session[:url] = request.url if (session[:url] == nil && !signed_in?)
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
    ['Sign Out', signout_url] if signed_in?
    ['Sign In',  signin_url]
  end
  #helper_method :current_user, :signed_in?, :requires_login, :redirect_back_or_to
end
