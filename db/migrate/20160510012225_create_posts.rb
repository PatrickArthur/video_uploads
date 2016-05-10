class CreatePosts < ActiveRecord::Migration
  def change
    create_table(:posts) do |t|
      t.integer :profile_id, null: false, default: 0
      t.string :post, null: false, default: ""
      t.timestamps null: false
    end
    add_index :posts, :id,              unique: true
  end
end


