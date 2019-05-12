Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'welcome#home'
  get 'signup', to: 'users#new', as: 'signup'
  get '/signin', to: 'sessions#new', as: 'login'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions, only: [:create, :new]
  resources :lessons
  resources :bookings
  resources :sections
  resources :skills
  resources :instructors do
    resources :reviews, only: [:index, :new, :create]
  end

end
