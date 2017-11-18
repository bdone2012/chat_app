Rails.application.routes.draw do
  get 'welcome/index'
 
  root 'welcome#index'
  resources :users
  resources :trainers
  resources :client_messages

  get  "/session_users/new"  => "session_users#new"
  post "/session_users"      => "session_users#create"
  get  "/logout"       => "session_users#destroy"
  get  "/session_trainers/new"  => "session_trainers#new"
  post "/session_trainers"      => "session_trainers#create"
  get  "/logout_trainer"       => "session_trainers#destroy"
end