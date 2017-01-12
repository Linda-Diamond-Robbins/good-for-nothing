class UserChallengesController < ApplicationController

  def index
    @user_challenges = UserChallenge.all
    render 'index.html.erb'
  end

 

  def new

  end

  def create
    @user_challenge = UserChallenge.new(
      challenge_id: params[:challenge_id],
      title: params[:title],
      description: params[:description],
      user_id: params[:user_id]
      )
    if @user_challenge.save
      flash[:success] = "User Challenge successfully created!"
      redirect_to "/user_challenges/{#{@user_challenge.id}"
      else
        render 'new.html.erb'
    end
  end



end
