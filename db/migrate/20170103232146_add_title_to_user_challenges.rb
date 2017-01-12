class AddTitleToUserChallenges < ActiveRecord::Migration[5.0]
  def change
    add_column :user_challenges, :title, :string
  end
end
