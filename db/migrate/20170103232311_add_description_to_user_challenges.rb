class AddDescriptionToUserChallenges < ActiveRecord::Migration[5.0]
  def change
    add_column :user_challenges, :description, :text
  end
end
