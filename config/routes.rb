Rails.application.routes.draw do
  resources :levels do
    resources :scores
  end
  root to: 'levels#index'
  
  devise_for :users
  
  get 'levels/:id/play' => 'levels#play', as: :play
end
