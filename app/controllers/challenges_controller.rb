class ChallengesController < ApplicationController

  def index
    @challenges = Challenge.all
    render 'index.html.erb'
  end

  def show
    @challenge = Challenge.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def new
    @challenge = Challenge.new
    render 'new.html.erb'
  end

  def create
    @challenge = Challenge.new(id: params[:id],
      title: params[:title], 
      description: params[:description],
      user_id: current_user.id,
      )
    if @challenge.save 
      flash[:success] = "Challenge successfully created!"
      redirect_to "/challenges/#{@challenge.id}"
    else
      render 'new.html.erb'
    end
  end

  def update
    @challenge = Challenge.find_by(id: params[:id])
    @challenge.title = params[:title]
    @challenge.description = params[:description]
    @challenge.public = params[:public]
    @challenge.user_id = params[:user_id]
    @challenge.save
    render 'update.html.erb' 
  end
  
  def edit
    @challenge = Challenge.find_by(id: params[:id])
    render 'edit.html.erb' 
  end

  def destroy
    @challenge
    render 'destroy.html.erb' 
  end
end
