class PagesController < ApplicationController
  def home
    render "home.html.erb"
  end

  def timeline
    @comment = Comment.new
    @completed_user_challenges = UserChallenge.where(status: "Completed!")
    @root_url = request.base_url
    render 'timeline.html.erb'
  end

  def research
  end

  def ideas
  end
end