class ReviewsController < ApplicationController
   def create
    @review = Review.new(review_params)
    @challenge = Challenge.find(review_params[:challenge_id])
    if @review.save
      redirect_to "/challenges/#{@challenge.id}"
    else
      redirect_to "/challenges/#{@challenge.id}"
    end
  end

  private 

    def review_params
      params.require(:review).permit(:text, :user_id, :challenge_id)
    end
end
