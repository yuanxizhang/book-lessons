Rails.application.routes.draw do
	root 'welcome#home'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get "/login_with_google", to: redirect("/auth/google_oauth2")

  resources :users
  get "/auth/:provider/callback", to: "sessions#create"

	resource :session, only: [:create, :destroy]
end
