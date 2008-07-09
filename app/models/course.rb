class Course < ActiveRecord::Base
  
  #belongs_to :round #,  :class_name => "Round", :foreign_key => "course_id" #each round has just one course
  has_many :rounds
  
  has_many :courseholes
  
  def self.grab_course course_id
    Course.find(:first, :conditions => ["courses.id = ?", course_id])
  end
  
  def self.grab_holes course_tee_id
    Coursehole.find(:all, :conditions => ["courseholes.course_tee_id = ?", course_tee_id])
  end
  
  def self.summary_info course_tee_id
    CourseTee.find(:first, :conditions => ["course_tees.id = ?", course_tee_id])
  end
  
  
end
