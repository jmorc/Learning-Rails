class UsersController < ApplicationController

  def show
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        log_in_user(@user)
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        flash[:errors] = @user.errors.full_messages
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
