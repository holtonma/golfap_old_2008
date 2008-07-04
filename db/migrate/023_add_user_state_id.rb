class AddUserStateId < ActiveRecord::Migration
  def self.up
    add_column :users, :state_id, :integer, :default => 47
  end

  def self.down
    remove_column :users, :state_id
  end
end


