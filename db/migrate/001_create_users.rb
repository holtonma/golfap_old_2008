class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.column :fname, :string
      t.column :lname, :string
      t.column :email, :string
      t.column :email_alt, :string
      t.column :subscription_id, :integer
      t.column :subscribed_date, :datetime
      t.column :send_email, :integer
    end
  end

  def self.down
    drop_table :users
  end
end
