Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, except: [:index]
  resource :session, only: [:new, :create, :destroy]

  root 'session#new'
end