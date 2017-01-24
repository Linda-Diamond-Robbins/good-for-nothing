class CreateForums < ActiveRecord::Migration[5.0]
  def change
    create_table :forums do |t|
      t.text :text
      t.string :image
      t.string :title
      t.integer :user_id

      t.timestamps
    end
  end
end
