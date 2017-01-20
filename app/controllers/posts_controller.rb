class PostsController < ApplicationController

  def create
    @post = Post.new(text: params[:text], user_id: params[:user_id], user_challenge_id: params[:user_challenge_id])

    if @post.save
      flash[:success] = "Thanks for sharing!"
      redirect_to "/users/#{current_user.id}"
    else
      flash[:success] = "Oops! Problem saving your post!"
      @user = User.find_by(id: params[:id]) 
      @user_challenges = UserChallenge.where(user_id: params[:id])
      render "users/show"
    end
  end
end