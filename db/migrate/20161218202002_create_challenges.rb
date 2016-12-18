class CreateChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :challenges do |t|
      t.string :title
      t.text :description
      t.boolean :public
      t.integer :user_id

      t.timestamps
    end
  end
end
