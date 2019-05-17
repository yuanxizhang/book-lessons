Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'welcome#home'
  get 'signup', to: 'users#new', as: 'signup'
  get '/signin', to: 'sessions#new', as: 'login'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  get 'auth/:provider/callback', to: 'sessions#twitter_auth'
  get 'auth/failure', to: redirect('welcome#home')

  get 'welcome/privacy', to: 'welcome#privacy'
  get 'welcome/terms', to: 'welcome#terms'

  resources :users
  resources :sessions, only: [:create, :new]
  resources :lessons
  resources :bookings
  resources :skills
  resources :sections do
    resources :skills, only: [:new, :create]
  end

  resources :instructors do
    resources :reviews, only: [:index, :new, :create]
  end

end
