class AddStatusToUserChallenges < ActiveRecord::Migration[5.0]
  def change
    add_column :user_challenges, :status, :string
  end
end
