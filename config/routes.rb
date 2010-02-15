ActionController::Routing::Routes.draw do |map|
  map.resources :sites

  map.resources :datasets

  map.resource :account, :controller => "users"
  map.resources :users
  map.resource :user_session
  map.root :controller => "user_sessions", :action => "new"
end
