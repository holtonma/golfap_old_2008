class SettingsController < ApplicationController
  
  include ApplicationHelper
  
  before_filter :init #, except => :create
  
  def init
    user_info
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
end
