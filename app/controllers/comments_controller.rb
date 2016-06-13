class CommentsController < ApplicationController

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @commentable, notice: "Successfully Posted!"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:title, :body)
  end
end
