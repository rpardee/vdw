class AddUserFields < ActiveRecord::Migration
  def self.up
    add_column :users, :email, :string
    add_column :users, :site_id, :integer
    add_column :users, :role, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :degrees, :string
  end

  def self.down
    remove_column :users, :email
    remove_column :users, :site_id
    remove_column :users, :role
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
    remove_column :users, :degrees, :string
  end
end
