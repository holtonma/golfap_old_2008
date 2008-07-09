class CreateCourseTees < ActiveRecord::Migration
  def self.up
    create_table :course_tees do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :course_tees
  end
end
