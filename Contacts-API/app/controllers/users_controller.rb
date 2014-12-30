class UsersController < ApplicationController
  
  def index
    render json: User.all
  end
  
  def create
    user = User.new(user_params)
      if user.save
        render json: user
      else
        render(
          json: user.errors.full_messages, status: :unprocessable_entity
        )
      end
  end
  
  def show
    user = User.find_by_id(params[:id])
    if user
      render json: user
    else
      render "No user with that id"
    end
  end
  
  def update
    user = User.find_by_id(params[:id])
    if user.update(user_params)
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end      
  end
  
  def destroy
    user = User.find_by_id(params[:id])
    user.destroy
    render json: user
  end
  
  private
  
  def user_params
    params[:user].permit(:username)
  end
    
end