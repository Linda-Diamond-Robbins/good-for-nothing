class Category < ApplicationRecord
  has_many :challenge_categories
  has_many :challenges, through: :challenge_categories

  def nospace_name
    name.gsub(/\s/, "").downcase
  end
end

