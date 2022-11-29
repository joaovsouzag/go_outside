Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: "locations#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :locations, only: [:index, :show] do
    resources :feedbacks, only: [:new, :create, :destroy]
    resources :check_ins, only: [:index, :create, :destroy]
  end

  resources :users, only: [:show] do
    resources :favorites, only: [:index, :create]
  end
end
