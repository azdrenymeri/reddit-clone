Rails.application.routes.draw do

  root to: 'static_pages#main'
  
  
  get '/wellcome', to: 'static_pages#index', as: 'static_pages_wellcome'
  get '/about', to: 'static_pages#about', as: 'static_pages_about'
  get '/main', to:'static_pages#main', as:'main_page'

  # User routes
  devise_for :users
  devise_scope :user do
    get 'users/profile/:id', to: 'users#show', as: 'users_profile'
    get 'users/sign_up/file', to:'registrations#file', as:'registrations_file'
  end
  resources :users

  resources :sub_reddits do

     post '/join', to:'sub_reddits#join', as:'join'
     post '/leave', to:'sub_reddits#leave', as:'leave'    
     resources :posts do

      resources :comments
       
     end
  end
  
  resources :users
end
