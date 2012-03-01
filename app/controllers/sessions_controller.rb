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
      flash.now.alert = "Invalid email or password"
      redirect_to new_session_url, alert: "Something went wrong!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end

