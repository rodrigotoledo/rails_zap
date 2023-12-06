Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :conversation do
    resources :messages, only: [:create, :index]
  end
end
