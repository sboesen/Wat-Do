class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_back_or_to tasks_url, notice: 'Signed up!'
    else
      redirect_to new_session_url, alert: 'Something went wrong!'
    end
  end
end
