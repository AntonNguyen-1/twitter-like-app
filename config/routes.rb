Rails.application.routes.draw do
  resources :tweets
  get '/users' => 'users#index'
  get '/users/:user_id' => 'users#show'
  post '/users/:user_id/follow' => 'users#follow'
  delete '/users/:user_id/unfollow' => 'users#unfollow'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  devise_for :users
end
