class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to "/timeline"
    else
      redirect_to "/timeline"
    end
  end

  private 

    def comment_params
      params.require(:comment).permit(:text, :user_id, :user_challenge_id)
    end
end
