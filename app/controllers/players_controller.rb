class PlayersController < ApplicationController

  def index
    @user_id = 1 #this will be modified to obtain session.user_id or 0 if not logged in
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
