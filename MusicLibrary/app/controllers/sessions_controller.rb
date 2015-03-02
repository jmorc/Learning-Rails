class SessionsController < ApplicationController
  
  def create
  	user = User.find_by_credentials(params[:user][:email], 
  		                             params[:user][:password])

  	if user.nil?
      flash[:notice] = "User not found"
  	  render :new
  	else
      log_in_user(user)
  	  redirect_to root_url
    end 
  end

  def destroy
  	current_user.reset_session_token!
  	session[:session_token] = nil
  	redirect_to new_session_url
  end

  def new
  end
  
end