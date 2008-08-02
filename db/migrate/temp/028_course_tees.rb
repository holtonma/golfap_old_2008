class CourseTees < ActiveRecord::Migration
  def self.up
    create_table :course_tees do |t|
      t.column :course_id, :integer
      t.column :tee_name, :string
      t.column :yardage, :integer
      t.column :rating, :double
      t.column :slope, :integer
      t.column :num_holes, :integer
      t.column :total_par, :integer
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
    end
  end
  
  def self.down
    drop_table :course_tees
  end
  
  remove_column :courses, :rating
  remove_column :courses, :slope
  remove_column :courses, :total_par
end
