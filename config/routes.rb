Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_scope :users do
    get 'sign_in', to: 'users/sessions#new'
  end

  # Defines the root path route ("/")
  root "welcome#index"

  namespace :user do
    resources :posts, only: :index
    resources :comments, only: :index
  end

  resources :posts, except: :index do
    resources :comments, except: [:index, :show, :new]
  end
end
