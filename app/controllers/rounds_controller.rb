class RoundsController < ApplicationController

  include ApplicationHelper
  
  before_filter :init #, except => :create
  
  def init
    user_info
  end
  
  # /players/:player_id/rounds     {:controller=>"rounds", :action=>"index"}
  def index
    #sometimes it's : /players/:player_id/rounds
    #sometimes      : /players/:player_id/rounds?m=6&y=2008
    @month = params[:m] || Time.now
    @year = params[:y] || Time.now
    @rounds_per_month = rounds_per_month_desc
    @rounds_hash = db_rounds_per_month_year
  end

  def show
  end

  def create
  end

  def new
    
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
    def db_rounds_per_month_year
      # num_rounds month_num year_num
      rounds_by_month_year = Round.find(:all, 
        :select => "Count(*) as num_rounds, EXTRACT(MONTH FROM date_played) as month_num,  EXTRACT(YEAR FROM date_played) as year_num", 
        :group => "EXTRACT(YEAR FROM date_played), EXTRACT(MONTH FROM date_played)",
        :order => "year_num DESC, month_num DESC",
        :limit => 12)
      
      rounds_by_month_year
    end
    
    def rounds_per_month_desc
      # 1.months.ago
      # select Count(*), EXTRACT(MONTH FROM date_played),  EXTRACT(YEAR FROM date_played) 
      # from rounds GROUP BY EXTRACT(YEAR FROM date_played), EXTRACT(MONTH FROM date_played)
      round_per_month_db = [4, 12, 13, 14, 17, 16, 22, 16, 11, 6, 5, 7] #ActiveRecord call, obtain rounds from last 12 mos
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
      # 12.times { |m|
      #   current = {}
      #   current[:year] = m.to_i.months.ago.year
      #   current[:month_num] = m.to_i.months.ago.month
      #   m_index = m.to_i.months.ago.month - 1
      #   current[:month] = @all_months[m_index]
      #   current[:num_rounds] = round_per_month_db[m_index]
      #   @rounds_per_month << current
      # }
      
      @rounds_per_month
    end
end
