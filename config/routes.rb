Rails.application.routes.draw do
  devise_for :users

  resources :levels do
    resources :scores
  end  
end
