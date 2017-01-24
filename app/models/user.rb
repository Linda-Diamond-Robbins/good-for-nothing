class User < ApplicationRecord
  has_secure_password
  has_many :user_challenges
  has_many :challenges, through: :user_challenges # the challenges the user did
  # has_many :created_challenges, class_name: :Challenge # the challenges the user created
  has_many :posts
  has_many :comments
  has_many :reviews
end

