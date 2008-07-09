class AddCourseHoleField < ActiveRecord::Migration
  
  add_column :courseholes, :course_tee_id, :integer
  
end
