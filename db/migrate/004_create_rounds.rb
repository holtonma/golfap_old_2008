class CreateRounds < ActiveRecord::Migration
  def self.up
    create_table :rounds do |t|
      t.column :date_played, :datetime
      t.column :course_id, :integer
      t.column :user_id, :integer
      t.column :weather_id, :integer
      t.column :holes_played, :integer
      t.column :clubset_id, :integer
      t.column :total_score, :integer
      t.column :total_putts, :integer
      t.column :total_gir, :integer
      t.column :fairways_hit, :integer
      t.column :fairways_right, :integer
      t.column :fairways_left, :integer
      t.column :fairway_opps, :integer
      t.column :sand_saves, :integer
      t.column :save_opps, :integer
      t.column :up_downs, :integer
      t.column :updown_opps, :integer
    end
  end

  def self.down
    drop_table :rounds
  end
end
