Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "splash#index"

  resources :users
  resources :categories, only: [:index, :show, :new, :create, :update, :destroy] do
    resources :payments, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end
end
