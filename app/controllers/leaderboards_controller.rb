class LeaderboardsController < ApplicationController
  
  include ApplicationHelper
  
  before_filter :init #, except => :create
  
  def init
    user_info
  end
  
  def index
   
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
  
end
