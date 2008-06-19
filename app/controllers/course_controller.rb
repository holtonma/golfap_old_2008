class CourseController < ApplicationController
  
  before_filter :init #, except => :create
  
  def init
    @user_id = 1 #this will be modified to authenticate / obtain session.user_id or 0 if not logged in
    @user_id
  end
  
  def index
  end

  def create
  end

  def new
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end
end
