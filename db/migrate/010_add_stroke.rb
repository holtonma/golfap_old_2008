class AddStroke < ActiveRecord::Migration
  def self.up
    add_column :strokes, :user_id, :integer
    add_column :strokes, :round_id, :integer
    add_column :strokes, :hole_id, :integer
    add_column :strokes, :shot_num, :integer
    add_column :strokes, :shot_type_id, :integer
    add_column :strokes, :club_id, :integer
    add_column :strokes, :from, :integer
    add_column :strokes, :ended_up, :integer
  end

  def self.down
    remove_column :strokes, :user_id
    remove_column :strokes, :round_id
    remove_column :strokes, :hole_id
    remove_column :strokes, :shot_num
    remove_column :strokes, :shot_type_id
    remove_column :strokes, :club_id
    remove_column :strokes, :from
    remove_column :strokes, :ended_up
  end
end
