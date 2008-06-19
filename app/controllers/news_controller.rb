class NewsController < ApplicationController
  before_filter :init #, except => :create
  
  def init
    @user_id = 1 #this will be modified to authenticate / obtain session.user_id or 0 if not logged in
    @user_id
  end
  
  def index
  end

  def show
  end
end
