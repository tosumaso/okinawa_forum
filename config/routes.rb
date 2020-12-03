Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts, only: [:index, :new, :create, :show] do
    collection do
      get 'search'
    end
    resources :rooms, only: [:index, :new, :create] do
      resources :messages, only: [:create]
      resources :memos, only: [:new]
    end
  end
  resources :users, only: [:edit, :update]
end
