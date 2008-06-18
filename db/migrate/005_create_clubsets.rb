class CreateClubsets < ActiveRecord::Migration
  def self.up
    create_table :clubsets do |t|
      t.column :date_saved, :datetime
      t.column :user_id, :integer
      t.column :name, :string
    end
  end

  def self.down
    drop_table :clubsets
  end
end
