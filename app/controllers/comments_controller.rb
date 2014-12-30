class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      flash[:alerts] = "Comment successfully posted"
      redirect_to post_url(@comment.post_id)
    else
      flash.now[:alerts] = @comment.errors.full_messages
      render :new
    end
  end

  def new
    @comment = Comment.new
  end

  def destroy
    @comment = Comment.find(params[:id])
    flash[:alerts] = "Comment deleted"
    post_id = @comment.post_id
    @comment.destroy
    redirect_to post_url(post_id)
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :author_id, :post_id,
                                    :parent_comment_id)
  end
end
