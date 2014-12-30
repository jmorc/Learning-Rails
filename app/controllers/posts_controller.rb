class PostsController < ApplicationController
  before_action :verify_poster, only: [:edit, :update]

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash.now[:alerts] = ["#{@post.title} updated!"]
      render :show
    else
      flash.now[:alerts] = @post.errors.full_messages
      render :new
    end
  end

  def destroy
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    if @post.save
      flash.now[:alerts] = ["#{@post.title} created!"]
      render :show
    else
      flash.now[:alerts] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def new
    @post = Post.new
  end

  private

  def verify_poster
    @post = Post.find(params[:id])
    current_user.id == @post.author_id
  end

  def post_params
    params.require(:post).permit(:title, :body, :author_id, :sub_ids => [])
  end
end
