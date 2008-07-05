class Foursome < ActiveRecord::Base
  
  belongs_to :round
  belongs_to :user, :class_name => "User", :foreign_key => "friend_user_id"
  
end
