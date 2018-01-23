Rails.application.routes.draw do
  root to: 'levels#index'

  devise_for :users

  resources :levels
  get 'levels/:id/play' => 'levels#play'

  resources :levels do
    resources :scores
  end  
end
