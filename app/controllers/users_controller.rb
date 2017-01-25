class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @completed_challenges = UserChallenge.where(user_id: params[:id], status:"Completed!")
    @user = User.find_by(id: params[:id]) 
    @user_challenges = UserChallenge.where(user_id: params[:id])
    # @user = User.find_by(id: current_user.id)
    # @user_challenges = UserChallenge.where(user_id: current_user.id)
  end 

  def new
    render 'new.html.erb'
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      session[:user_id] = user.id
      flash[:success] = 'Successfully created account!'
      redirect_to '/challenges'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/signup'
    end
  end

  def calendar
    @user = User.find(params[:id])
    @completed_challenges = UserChallenge.where(user_id: params[:id], status:"Completed!")
  end
end