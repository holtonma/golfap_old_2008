class CreateFoursome < ActiveRecord::Migration
  def self.up
    create_table :foursomes do |t|
      execute "SET FOREIGN_KEY_CHECKS=0"
      drop_table :foursomes
      t.column :round_id, :integer
      t.column :user_id, :integer
      t.column :friend_user_id, :integer #corresponds to user_id of the person whom you were playing with
      t.column :friend_lname, :string #need to store friend info in here...if they are not a user in golfap
      t.column :friend_fname, :string #if they choose to sign up, this info will be used to help them sign up
      t.column :friend_email, :string
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
    end
    
  end

  def self.down
    drop_table :foursomes
  end
end
