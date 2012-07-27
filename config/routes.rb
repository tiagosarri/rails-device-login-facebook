RailsDeviceLoginFacebook::Application.routes.draw do
  devise_for :users

  root :controller => 'home', :action => 'index'
  
  match '/auth/facebook/callback', :to => 'home#connect_facebook'
end
