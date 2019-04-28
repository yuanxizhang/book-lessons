Rails.application.routes.draw do
  root 'welcome#home'
  get 'signup', to: 'users#new', as: 'signup'
  get '/signin', to: 'sessions#new', as: 'login'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:creat, :new]
  resources :lessons
  resources :instructors do
    resources :lessons
  end
  resources :bookings
  resources :skills
end
