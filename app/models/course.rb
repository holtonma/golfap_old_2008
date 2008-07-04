class Course < ActiveRecord::Base
  
  #belongs_to :round #,  :class_name => "Round", :foreign_key => "course_id" #each round has just one course
  has_many :rounds
  has_many :courseholes
  
end
