class CreateSubscriptions < ActiveRecord::Migration
  
  def self.up
    create_table :subscriptions do |t|
      t.column :name, :string
      t.column :descrip, :string
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
    end
  end

  def self.down
    drop_table :subscriptions
  end
end
