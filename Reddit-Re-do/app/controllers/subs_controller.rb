class SubsController < ApplicationController
  before_action :verify_moderator, only: [:edit, :update]

  def index
    @subs = Sub.all
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save
      flash.now[:alerts] = ["#{@sub.title} created!"]
      render :show
    else
      flash.now[:alerts] = @sub.errors.full_messages
      render :new
    end
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])

    if @sub.update(sub_params)
      flash.now[:alerts] = ["#{@sub.title} updated!"]
      render :show
    else
      flash[:alerts] = @sub.errors.full_messages
      render :new
    end
  end

  def destroy
    @sub = Sub.find(params[:id])
    flash[:alerts] = ["#{@sub.title} deleted!"]
    @sub.destroy
    redirect_to subs_url
  end

  private

  def verify_moderator
    @sub = Sub.find_by(params[:id])
    current_user.id == @sub.moderator_id
  end

  def sub_params
    params.require(:sub).permit(:title, :description, :moderator_id)
  end
end
