class CommentsController < ApplicationController

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @commentable, notice: "Successfully Posted!"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @comment.commentable, notice: "Comment was updated."
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to @comment.commentable, notice: "Deleted"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:title, :body)
  end
end
