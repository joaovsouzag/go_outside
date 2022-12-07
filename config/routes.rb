Rails.application.routes.draw do
  # get 'comments/index'
  # get 'videos/index'
  # get 'images/index'
  get 'users/show'
  devise_for :users
  root to: "locations#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :locations, only: [:index, :show] do
    resources :feedbacks, only: [:new, :create, :destroy]
    resources :check_ins, only: [:index, :create, :destroy]
    resources :favorites, only: [:index, :create, :destroy]
    resources :images, only: [:index]
    resources :videos, only: [:index]
    resources :comments, only: [:index]
    resources :chatrooms, only: [:show]
  end

  resources :chatrooms, only: [:create] do
    resources :messages, only: [:create]
  end

  resources :users, only: [:show] do
    resources :favorites, only: [:index, :create]
  end

  resources :pages do
    collection do
      get :home
    end
  end
end
