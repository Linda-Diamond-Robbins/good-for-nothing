class Api::V1::ChallengesController < ApplicationController
  def index
    @challenges = Challenge.all
    render 'index.json.jbuilder'
  end
end
