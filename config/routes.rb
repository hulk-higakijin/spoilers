Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  resources :animes do
    resources :discussions, only: [:show]
  end
end
