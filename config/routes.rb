Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  root to: "items#index"

  resources :users, only: :show
  resources :items do
    resources :orders, only: [:index, :create]
    resources :comments, only: :create
    resources :reviews, only: :create
    collection do
      get 'search'
    end
  end
end
