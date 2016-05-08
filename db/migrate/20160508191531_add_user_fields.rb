class AddUserFields < ActiveRecord::Migration
  def up
    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :string
    add_column :users, :phone, :string
  end

  def down
    remove_column :executions, :name, :string
    remove_column :executions, :address, :string
    remove_column :executions, :city, :string
    remove_column :executions, :state, :string
    remove_column :executions, :zip, :string
    remove_column :executions, :phone, :string
  end
end
