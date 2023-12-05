Rails.application.routes.draw do
  resource :example, constraints: -> { Rails.env.development? }
  root 'home#index'
  devise_for :users
  resources :conversation do
    resources :messages, only: [:create, :index]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
