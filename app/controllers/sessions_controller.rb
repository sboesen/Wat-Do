class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_back_or_to tasks_url, notice: "Logged in!"
    else
      
      if (user)
        flash.now.alert = "Sorry! Your password doesn't match what we have in our records."
      else
        flash.now.alert = "Sorry! Your email address doesn't match any in our records!"
      end
      redirect_to new_session_url, alert: "Something went wrong!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end

