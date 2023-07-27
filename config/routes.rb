Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :groups
  resources :users do
    resources :user_groups, path: '/groups', only: %i[ index create destroy ]
  end

  namespace :auth do
    post :login
    post :register
    get :me
  end

  # Defines the root path route ("/")
  root "users#index"
end
