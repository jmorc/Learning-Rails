class CommentsController < ApplicationController
  def index
    @commentable = find_commentable
    @comments = @commentable.comments
  end
  
  def create
    comment = Comment.new(comment_params)
    comment[:commentable_id] = params[:user_id] || 
                            params[:contact_id] || 
                            params[:contact_share_id]
    comment[:commentable_type] = find_commentable_type
      if comment.save
        render json: comment
      else
        render(
          json: comment.errors.full_messages, status: :unprocessable_entity
        )
      end
  end
  
  def show
    comment = Comment.find_by_id(params[:id])
    if comment
      render json: comment
    else
      render "No comment with that id"
    end
  end
  
  def update
    comment = Comment.find_by_id(params[:id])
    if comment.update(comment_params)
      render json: comment
    else
      render(
        json: comment.errors.full_messages, status: :unprocessable_entity
      )
    end      
  end
  
  def destroy
    comment = Comment.find_by_id(params[:id])
    comment.try(:destroy)
    render json: comment
  end
  
  private
  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
  
  def find_commentable_type
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify
      end
    end
    nil
  end

  def comment_params
    params[:comment].permit(:content)
  end

end

