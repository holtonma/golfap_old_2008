class Round < ActiveRecord::Base
  
  has_one :course
  has_one :user
  
  def last_ten_rounds
    Round.find(:all, :limit => 10, :order => "DESC")
  end
  
end
