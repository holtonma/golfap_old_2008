class CreateCourseholes < ActiveRecord::Migration
  def self.up
    create_table :courseholes do |t|
      t.column :course_id, :integer
      t.column :par, :integer
      t.column :yardage, :integer
      t.column :holenum, :integer
      t.column :handicap, :integer
      t.column :date_added, :datetime
    end
  end

  def self.down
    drop_table :courseholes
  end
end
