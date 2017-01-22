class PagesController < ApplicationController
  def home
    render "home.html.erb"
  end

  def timeline
    @completed_user_challenges = UserChallenge.where(status: "Completed!")
    render 'timeline.html.erb'
  end

  def research
  end

  def ideas
  end
end