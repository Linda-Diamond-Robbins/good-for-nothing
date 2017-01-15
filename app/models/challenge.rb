class Challenge < ApplicationRecord

  belongs_to :user # the person who made the challenge
  has_many :user_challenges # many instances of users accepting a challenge
  has_many :users, through: :user_challenges # the people who did this challenge
  has_many :challenge_categories
  has_many :categories, through: :challenge_categories
end
