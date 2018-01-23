Rails.application.routes.draw do
  root to: 'levels#index'
  
  devise_for :users
  
  get 'levels/:id/play' => 'levels#play'
  
  resources :levels
end
