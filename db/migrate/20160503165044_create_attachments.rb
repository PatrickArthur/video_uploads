class CreateAttachments < ActiveRecord::Migration
  def change
    create_table(:attachments) do |t|
      t.integer :user_id, :null => false
      t.string :name, null: false, default: ""
      t.string :description, null: false, default: ""
      t.timestamps null: false
    end
    add_index :attachments, :user_id
  end
end
