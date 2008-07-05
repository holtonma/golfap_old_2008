class Round < ActiveRecord::Base
  
  belongs_to :user #yes! ...potentially many rounds belong to just 1 user
  belongs_to :course #yes!... potentially many rounds belong to just 1 course... 
  belongs_to :round_type # potentially many rounds belong to just 1 type
  has_many :foursomes
  
  #belongs_to :course 
  #has_one :courses, :class_name => "Course", :foreign_key => "course_id" #each round has just one course
  #has_many :foursomes
  
  def self.last_n_rounds(user_id, n=10)
    Round.find(:all, :conditions => ["rounds.user_id = ?", user_id], 
               #:joins => "LEFT JOIN courses ON rounds.course_id = courses.id",
               :limit => "#{n}", :order => "date_played DESC") 
  end
  
  def self.output_over_under_par(course_par, score)
    if (score > course_par)
      return "+ #{(score - course_par).to_s}"
    else
      return (score - course_par).to_s
    end
  end
  
  def self.db_rounds_per_month_year
    # num_rounds month_num year_num
    rounds_by_month_year = Round.find(:all, 
      :select => "Count(*) as num_rounds, EXTRACT(MONTH FROM date_played) as month_num,  EXTRACT(YEAR FROM date_played) as year_num", 
      :group => "EXTRACT(YEAR FROM date_played), EXTRACT(MONTH FROM date_played)",
      :order => "year_num DESC, month_num DESC",
      :limit => 12)
    
    rounds_by_month_year
  end
  
  def self.rounds_per_month_desc
    # select Count(*), EXTRACT(MONTH FROM date_played),  EXTRACT(YEAR FROM date_played) 
    # from rounds GROUP BY EXTRACT(YEAR FROM date_played), EXTRACT(MONTH FROM date_played)
    @all_months = %w(January February March April May June July 
      August September October November December)
    @rounds_per_month = []
    @db_rounds_per_month_year = db_rounds_per_month_year
    @db_rounds_per_month_year.each do |r|
      current = {}
      current[:year] = r.year_num
      current[:month_num] = r.month_num
      
      current[:month] = @all_months[r.month_num.to_i - 1]
      current[:num_rounds] = r.num_rounds
      @rounds_per_month << current
    end
    
    @rounds_per_month
  end
  
end
