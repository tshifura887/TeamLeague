Rails.application.routes.draw do
  devise_for :users
  root 'teams#index'
  resources :teams do
    resources :players
  end
  
  resources :games do
    get 'points', on: :member
  end
  resources :tournaments
end
