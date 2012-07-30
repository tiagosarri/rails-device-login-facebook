class HomeController < ApplicationController
  def connect_facebook
    auth = request.env['omniauth.auth']
    #data = request.env["omniauth.auth"].to_yaml
    
    if user = User.find_by_email(auth["info"]["email"])
      user
    else # Create an user with a stub password.
      User.create!(:email => auth["info"]["email"], :name => auth["info"]["name"], :facebook_id => auth['uid'], :facebook_access_token => auth['credentials']['token'], :password => Devise.friendly_token[0,20])
      user = User.find_by_email(auth["info"]["email"])
    end
    
    sign_in_and_redirect(:user, user)
  end  
end