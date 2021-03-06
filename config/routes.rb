Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  get  '/login',   to: 'sesions#new'
  post   '/login',   to: 'sesions#create'
  delete '/logout',  to: 'sesions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :microposts
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :relationships,       only: [:create, :destroy]
end
