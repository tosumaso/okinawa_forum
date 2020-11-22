Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts, only: [:index, :new, :create, :show] do
    resources :rooms, only: [:index, :new, :create] do
      resources :messages, only: [:create]
    end
  end
end
