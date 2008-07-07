class RoundsController < ApplicationController

  include ApplicationHelper
  
  before_filter :init #, except => :create
  
  def init
    user_info
    user_id_from_authentication = 1 #replace this with logic from SESSION
    @user = User.user_info(user_id_from_authentication)
    @user_id = @user.id # refactor this out
    @state_id = @user.state_id #refactor this out 
  end
  
  def index
    # /players/:player_id/rounds     {:controller=>"rounds", :action=>"index"}
    #sometimes it's : /players/:player_id/rounds
    #sometimes      : /players/:player_id/rounds?m=6&y=2008
    @month = params[:m] || -1
    @year = params[:y] || -1
    @all_months = %w(January February March April May June July 
      August September October November December)
    @daynames = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
    
    @rounds_per_month = Round.rounds_per_month_desc
    @rounds_hash = Round.db_rounds_per_month_year #sidebar aggregate 
    
    if (@month == -1 || @year == -1)   
      @my_round_details = Round.last_n_rounds(@user_id, 10) #last 10 rounds, with all details from db
    else
      @my_round_details = Round.specific_month_rounds(@user_id, @year, @month)
    end
    
  end

  def show
    # shows rounds 
    # /players/:player_id/rounds/:id     {:controller=>"rounds", :action=>"show"}
    @round_id = params[:id]
    @player_id = params[:player_id]
    
    @round = Round.grab_round(@round_id)
    
    #refactor 
    @month = params[:m] || -1
    @year = params[:y] || -1
    @all_months = %w(January February March April May June July 
      August September October November December)
    @daynames = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
    
    @rounds_per_month = Round.rounds_per_month_desc
    @rounds_hash = Round.db_rounds_per_month_year #sidebar aggregate 
    
    if (@month == -1 || @year == -1)   
      @my_round_details = Round.last_n_rounds(@user_id, 10) #last 10 rounds, with all details from db
    else
      @my_round_details = Round.specific_month_rounds(@user_id, @year, @month)
    end
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
