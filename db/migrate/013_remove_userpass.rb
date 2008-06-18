class RemoveUserpass < ActiveRecord::Migration
  def self.up
    remove_column :users, :password
  end

  def self.down
  end
end
