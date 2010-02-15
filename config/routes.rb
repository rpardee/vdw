ActionController::Routing::Routes.draw do |map|
  map.resources :dataset_implementations


  map.resources :sites

  map.resources :datasets

  map.resource :account, :controller => "users"
  map.resources :users
  map.resource :user_session
  map.root :controller => "data_overview"
  map.connect "data_overview", :controller => "data_overview"
end
