class Category < ApplicationRecord
  has_many :challenge_categories
  has_many :challenges, through: :challenge_categories
end

