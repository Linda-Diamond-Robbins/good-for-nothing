class Challenge < ApplicationRecord

  belongs_to :user # the person who made the challenge
  has_many :user_challenges # many instances of users accepting a challenge
  has_many :users, through: :user_challenges # the people who did this challenge
  has_many :reviews
  has_many :challenge_categories
  has_many :categories, through: :challenge_categories

  def cat_list
    category_string = ""

    categories.each do |category|
      category_string += "#{category.nospace_name} "
    end
    category_string.squish
  end

  def friendly_date
   return created_at.strftime("%B %Y")
  end
end
