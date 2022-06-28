Rails.application.routes.draw do
  devise_for :users
  root 'teams#index'
  resources :teams do
    resources :players
  end
  
  resources :games
  resources :tournaments
end
