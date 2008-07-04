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
    @all_months = %w(January February March April May June July 
      August September October November December)
    @daynames = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
    @rounds_per_month = Round.rounds_per_month_desc
    @rounds_hash = Round.db_rounds_per_month_year
    @my_round_details = Round.last_n_rounds(@user_id, 10) #last 10 rounds
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
  
end
