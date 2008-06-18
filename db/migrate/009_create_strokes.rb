class CreateStrokes < ActiveRecord::Migration
  def self.up
    create_table :strokes do |t|
    end
  end

  def self.down
    drop_table :strokes
  end
end
