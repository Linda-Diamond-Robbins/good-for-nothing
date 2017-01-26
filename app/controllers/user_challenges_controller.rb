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
      user_id: params[:user_id],
      status: params[:status]
      )
    if @user_challenge.save
      flash[:success] = "Good Challenge Successfully Created!"
      redirect_to "/users/#{current_user.id}"
      else
        render 'new.html.erb'
    end
  end

  def edit
    @user_challenge = UserChallenge.find_by(id: params[:id])
  end
  
  def update
    @user_challenge = UserChallenge.find_by(id: params[:id])
    if @user_challenge.update(status: params[:status],
      results_reflection: params[:results_reflection]
      ) 
      redirect_to "/users/#{current_user.id}"
    end
  end
end