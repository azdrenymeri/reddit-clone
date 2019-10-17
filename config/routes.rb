Rails.application.routes.draw do

  get 'sub_reddits/index'
  root to: 'static_pages#index'
  get '/wellcome', to: 'static_pages#index', as: 'static_pages_wellcome'
  get '/about', to: 'static_pages#about', as: 'static_pages_about'

  # User routes
  devise_for :users
  devise_scope :user do
    get 'users/profile/:id', to: 'users#show', as: 'users_profile'
  end

  resources :users
  resources :sub_reddits
  resources :posts
  resources :users
end
