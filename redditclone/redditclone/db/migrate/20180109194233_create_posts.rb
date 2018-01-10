class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.text :content
      t.integer :sub_id, index: true, null: false
      t.integer :user_id, index: true, null: false
      t.timestamps
    end
  end
end
