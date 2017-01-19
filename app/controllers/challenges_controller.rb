class ChallengesController < ApplicationController

  def index
    @challenges = Challenge.all
    @challenge = Challenge.new
    @categories = Category.all
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
    @challenge = Challenge.new(challege_params)
    
    if @challenge.save 
      p @challenge.errors.full_messages
      flash[:success] = "Challenge successfully created!"
      redirect_to "/challenges/#{@challenge.id}"
    else
      render 'new.html.erb'
    end
  end

  def update
    @challenge = Challenge.find_by(id: params[:id])
    @challenge.update(challege_params) 
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

  private

  def challege_params
    params.require(:challenge).permit(:title, :description, :public, :user_id, category_ids:[])
  end
end
