Rails.application.routes.draw do
  root 'welcome#home'

  devise_for :users, skip: [:sessions]
  as :user do
    get 'signin', to: 'devise/sessions#new', as: :new_user_session
    post 'signin', to: 'devise/sessions#create', as: :user_session
    delete 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  authenticated :user do
    devise_scope :user do
      root to: "users/show", :as => "profile"
    end
  end

  unauthenticated do
    devise_scope :user do
      root to: "registrations#new", :as => "unauthenticated"
    end
  end
  # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, only: [:new, :create, :show, :update]
  resources :lessons
  resources :instructors do
    resources :lessons
  end
  resources :bookings
  resources :subjects
end
