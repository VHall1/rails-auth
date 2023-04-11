Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :groups

  resources :users do
    member do
      post :assign_group
      get :groups
    end
  end

  namespace :auth do
    post :login
    post :register
    get :me
  end

  # Defines the root path route ("/")
  root "users#index"
end
