class TournamentsController < ApplicationController
  
  before_filter :init #, except => :create
  
  def init
    @user_id = 1 #this will be modified to authenticate / obtain session.user_id or 0 if not logged in
    @state_id = 30 # this will be based off ip address(?) if not logged in
  end
  
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
