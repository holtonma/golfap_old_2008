class Round < ActiveRecord::Base
  
  has_one :course
  has_one :user
  has_many :foursomes
  
  def last_ten_rounds
    Round.find(:all, :limit => 10, :order => "DESC")
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
