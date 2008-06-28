class RoundsController < ApplicationController

  include ApplicationHelper
  
  before_filter :init #, except => :create
  
  def init
    user_info
  end
  
  # /players/:player_id/rounds     {:controller=>"rounds", :action=>"index"}
  def index
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
