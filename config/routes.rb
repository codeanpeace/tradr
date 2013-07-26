WdiTradr::Application.routes.draw do
  get 'users/refresh_table' => 'users#refresh_table'
  get '/stocks/graph/:symbol' => 'stocks#graph'
  get 'users/refresh_chart' => 'users#refresh_chart'
  resources :stocks, :only => [:create]

  resources :user_sessions
  resources :users

  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout

  root :to => 'users#show'
end
