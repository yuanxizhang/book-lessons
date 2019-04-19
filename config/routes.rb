Rails.application.routes.draw do
	root 'welcome#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get "/login_with_google", to: redirect("/auth/google_oauth2")

  
  get "/auth/:provider/callback", to: "sessions#create"
  get 'auth/failure', to: redirect('welcome#home')

  resources :users
	resource :session, only: [:create, :destroy]
end
