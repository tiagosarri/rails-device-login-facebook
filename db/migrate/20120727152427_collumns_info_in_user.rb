class CollumnsInfoInUser < ActiveRecord::Migration
  def self.up
    add_column :users, :name, :string, :limit => 100, :null => false
    add_column :users, :facebook_id, :integer
    add_column :users, :facebook_access_token, :string, :limit => 200
  end

  def self.down
    remove_column :users, :name
    remove_column :users, :facebook_id
    remove_column :users, :facebook_access_token
  end
end
