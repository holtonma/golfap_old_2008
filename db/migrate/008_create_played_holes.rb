class CreatePlayedHoles < ActiveRecord::Migration
  def self.up
    create_table :played_holes do |t|
      t.column :user_id, :integer
      t.column :round_id, :integer
      t.column :hole_id, :integer
      t.column :score, :integer
      t.column :putts, :integer 
    end
  end

  def self.down
    drop_table :played_holes
  end
end
