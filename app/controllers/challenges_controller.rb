class ChallengesController < ApplicationController

  def index
    @challenges = Challenge.all
    @challenge = Challenge.new
    @categories = Category.all
    render 'index.html.erb'
  end

  def show
    @challenge = Challenge.find_by(id: params[:id])
    @reviews = @challenge.reviews
    @review = Review.new
    @challenge_form = ChallengeForm.new
    gon.accepted = ((UserChallenge.where(status: "Accepted").count).to_f / 100)
    gon.in_progress = ((UserChallenge.where(status: "In Progress").count).to_f / 100)
    gon.completed = ((UserChallenge.where(status: "Completed!").count).to_f / 100)
    render 'show.html.erb'
  end

  def new
    @challenge = Challenge.new
    render 'new.html.erb'
  end

  def create
    @challenge = Challenge.new(challenge_params)
    
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

  def send_challenge
    challenge_email = ChallengeForm.new(params[:challenge_form])
    challenge_email.request = request
    if challenge_email.deliver
      flash[:success] = "Good Is On Its Way!"
      redirect_to "/challenges"
    else 
      p challenge_email.errors
      flash[:warning] = "Email message failed to send. Try again!"
      redirect_to "/challenges"
    end
  end

  private

  def challenge_params
    params.require(:challenge).permit(:title, :description, :public, :user_id, category_ids:[])
  end
end
