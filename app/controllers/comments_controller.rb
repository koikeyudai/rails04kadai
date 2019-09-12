class CommentsController < ApplicationController
  def new
   @comment = Comment.new
   @topic_id = params[:topic_id]
  end
  
  def create
    comment = current_user.comments.new(comment_params)
    comment.topic_id = params[:topic_id]  
    #binding.pry
    if comment.save
      redirect_to topics_path, success: 'コメントしました'
    else
      flash.now[:danger] = 'コメントに失敗しました'
      redirect_to topics_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end