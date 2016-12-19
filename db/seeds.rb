# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


names = ["lauren", "peter", "jay", "linda", "diana"]

names.each do |name|
  user = User.new(name: name, email: "#{name}@gmail.com", password: "password") 
  user.save
  # or you can do
  # user = User.create(name: name, email: "#{name}@gmail.com", password: "password") 
  5.times do
    challenge = Challenge.create(
      title: Faker::Lorem.sentence, 
      description: Faker::Lorem.paragraph(10), 
      public: Faker::Boolean.boolean, 
      # Or do I use: public: Faker::Boolean.boolean(0.2)?
      user_id: user.id
      )
    challenge.save
  end
end

puts "Done!"

users = User.all
random_challenge = Challenge.find_by(id: rand(Challenge.all.length))

users.each do |user|
  #challenge_id_array = Challenge.where.not(user_id: user.id).pluck(:id)
  #challenge_id_array.shuffle.pop)
  3.times do 
    UserChallenge.create(user_id: user.id, challenge_id: random_challenge.id)
  end
end

# # Peter said:
# loop through all users (User.all)
#   inside the loop, create 3 subscriptions using 3.times do
#     user_challenge = UserChallenge.new(user_id: user.id, challenge_id: ___a_random_challenge_id____)

#Peter's example from the video
# articles.each do |article|
#   users.each do |user|
#     vote = Vote.new(
#       user_id: user.id,
#       article_id: article.id,
#       vote_value: [-1, 0, 1].sample
#       )
#       vote.save
#     end
#   end


#thought from Linda...
 # If I were to add a like feature would it look like the following?
 #users = User.all
 #challenges = Challenge.all

 # challenges.each do |challenge|
 #   users.each do |user|
 #     like = Like.new(
 #     user_id: user.id,
 #     challenge_id: challenge.id
 #     like_value: true?
 #     )
 #     like.save
 #     end
 #     end

     # Lauren!!!  Peter is saying that the code I have above is that each user has created a challenge!  So rude!
     # I kept telling him that they would pick a challenge and he just looked at me, said, "Yeah, later." and went on.
     # He said that I have to now make another loop

     
