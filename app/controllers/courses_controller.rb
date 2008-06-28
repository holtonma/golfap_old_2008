class CoursesController < ApplicationController
  
  include ApplicationHelper
  
  before_filter :init #, except => :create
  
  def init
    user_info
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
