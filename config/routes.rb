Rails.application.routes.draw do
  namespace :admin do
      resources :discussions
      resources :comments
      resources :animes
      resources :users

      root to: "discussions#index"
    end
  root 'home#index'

  devise_for :users
  resources :animes do
    resources :discussions, only: [:show]
  end
end
