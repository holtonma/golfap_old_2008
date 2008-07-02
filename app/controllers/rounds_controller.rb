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
    def rounds_per_month_desc
      # 1.months.ago
      round_per_month_db = [4, 12, 13, 14, 17, 16, 22, 16, 11, 6, 5, 7] #ActiveRecord call, obtain rounds from last 12 mos
      @all_months = %w(January February March April May June July 
        August September October November December)
      @rounds_per_month = []
      12.times { |m|
        current = {}
        current[:year] = m.to_i.months.ago.year
        current[:month_num] = m.to_i.months.ago.month
        m_index = m.to_i.months.ago.month - 1
        current[:month] = @all_months[m_index]
        current[:num_rounds] = round_per_month_db[m_index]
        @rounds_per_month << current
      }
      
      @rounds_per_month
    end
end
