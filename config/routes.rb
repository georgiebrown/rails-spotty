Rails.application.routes.draw do
  devise_for :users, :path => 'accounts'
  resources :users, only: [:show] do
    resources :follows, only: [:create]
  end
  delete 'unfollow/:id', to: 'follows#destroy', as: 'unfollow'
  root to: 'pages#home'
  get 'map', to: 'maps#show'


  resources :spots, only: [:show, :index ] do
    resources :favourites, only: :create
    resources :stories, only: [:new, :show, :create]
  end
  resources :favourites, only: [:index, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
