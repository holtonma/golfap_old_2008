class NewsController < ApplicationController
  
  include ApplicationHelper
  
  before_filter :init #, except => :create
  
  def init
    user_info
  end
  
  def index
  end

  def show
  end
end
