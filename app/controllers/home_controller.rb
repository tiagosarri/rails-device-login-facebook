class HomeController < ApplicationController
  def connect_facebook
    auth = request.env['omniauth.auth']
    data = request.env["omniauth.auth"].to_yaml
    
    if user = User.find_by_email(data["email"])
      user
    else # Create an user with a stub password.
      User.create!(:email => data["email"], :password => Devise.friendly_token[0,20])
    end
    
    #@user = User.find_by_id current_user.id
    #@user.facebook_token = auth['credentials']['token']
    #@user.facebook_uid = auth['uid']
    
    #auth["info"]["email"]
    
    #@user.save!
    
    #redirect_to '/pageClose.html'
    render :text => " uid: #{auth["info"]["email"]}"
  end  
end