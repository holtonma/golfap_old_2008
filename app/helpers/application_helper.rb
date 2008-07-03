# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def user_info #grab user info from lookup (upon login?)
    @user = User.find(:all, :conditions => ["id = ?", 1])
    @user_id = @user.id
    @state_id = 32
  end
  
  def url_for_gravatar(email)
    gravatar_id = Digest::MD5.hexdigest(email)
    "http://www.gravatar.com/avatar.php?gravatar_id=#{gravatar_id}"
    # url_for({ :gravatar_id => Digest::MD5.hexdigest(email), :host => 'www.gravatar.com', 
    #           :protocol => 'http://', :only_path => false, :controller => 'avatar.php'
    #         }.merge(options))
    # link the avatar to some/url:
    # <%= link_to(image_tag(gravatar_url_for 'holtonma@gmail.com'), 'some/url')%>
    # <%= image_tag(gravatar_url_for 'holtonma@gmail.com')%>
    
  end
  
end
