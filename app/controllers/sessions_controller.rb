class SessionsController < ApplicationController

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user.nil?
      flash.now[:alerts] = "Invalid username or password"
      redirect_to new_session_url
    else
      flash.now[:alerts] = "Welcome back!"
      login(user)
      redirect_to user_url(user)
    end
  end

  def new
    @user = User.new
  end

  def destroy
    logout
    redirect_to new_session_url
  end
end
