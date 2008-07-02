class ModifyFriends < ActiveRecord::Migration
  def self.up
    add_column :friends, :friend_initiator_id, :integer #indicates who is friends with whom
    add_column :friends, :friend_acceptor_id, :integer #indicates who is friends with whom
    add_column :created_at, :datetime
    add_column :updated_at, :datetime
  end

  def self.down
    remove_column :friends, :friend_initiator_id
    remove_column :friends, :friend_acceptor_id
    remove_column :created_at
    remove_column :updated_at
  end
end
