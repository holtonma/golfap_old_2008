class Coursehole < ActiveRecord::Base
  
  has_one :stroke
  belongs_to :course
  
end
