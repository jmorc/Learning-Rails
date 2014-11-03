class UsersController < ApplicationController

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      render :show
    else
      flash.now[:alerts] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
  end

  def destroy
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :session_token)
  end
end
