class CreateUserProfile < ActiveRecord::Migration
   def change
     create_table(:profiles) do |t|
       t.integer :user_id, null: false, default: 0
       t.string :name, null: false, default: ""
       t.string :address, null: false, default: ""
       t.string :city, null: false, default: ""
       t.string :state, null: false, default: ""
       t.string :phone, null: false, default: ""
       t.string :zip, null: false, default: ""


       t.timestamps null: false
     end

     add_index :profiles, :name,                unique: true
   end
 end
