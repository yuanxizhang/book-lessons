Rails.application.routes.draw do
  root 'welcome#home'

  devise_for :users, path: 'users', controllers: { sessions: "users/sessions" }
  # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, only: [:new, :create, :show, :update]
  resources :lessons
  resources :instructors do
    resources :lessons
  end
  resources :bookings
  resources :subjects
end
