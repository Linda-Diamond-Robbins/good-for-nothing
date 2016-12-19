class UserChallenge < ApplicationRecord

  belongs_to :user # This is because user accepted the challenge
  belongs_to :challenge # This is because the user challenge is created when a user accepted that specific challenge it created an instance)
end
