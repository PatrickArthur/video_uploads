class CreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :name, null: false, default: ""
      t.string :address, null: false, default: ""
      t.string :city, null: false, default: ""
      t.string :state, null: false, default: ""
      t.string :phone, null: false, default: ""
      t.string :zip, null: false, default: ""


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
  end
end
