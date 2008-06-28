# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def user_info #grab user info from lookup (upon login?)
    @user_id = 2
    @state_id = 32
  end
  
end
