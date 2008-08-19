class TeesController < ApplicationController

  def index
    # course_tees GET    
    # /courses/:course_id/tees                                                           
    # {:controller=>"tees", :action=>"index"}
    
    #updates course_tees based on Course selected
    course = Course.find(params[:course_id])
    tees = course.course_tees.sort!{ |a,b| b.yardage <=> a.yardage } #yardage DESC
    
    respond_to do |format|
      format.json  { render :json => tees }
    end
    
    # render :update do |page|
    #   page.replace_html 'tees', :partial => 'course_tees', :object => tees
    # end
  end
  
  def show
    # formatted_course_tee GET    /courses/:course_id/tees/:id.:format  {:controller=>"tees", :action=>"show"}
    # grab the tees
    tee_info = CourseTee.find(params[:id])
    
    respond_to do |format|
      format.json  { render :json => tee_info }
    end
  end
  
  
end
