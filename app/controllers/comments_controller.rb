class CommentsController < ApplicationController

  def create
    if comment = Comment.create(comment_params)
      redirect_to "/prototypes/#{comment.prototype.id}"
    else
      render :show
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end 
end
