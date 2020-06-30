Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  namespace :users do
    get '', to: 'connections#index'

    get 'my_followers', to: 'connections#followers', as: 'my_followers'
    get 'my_follows', to: 'connections#follows', as: 'my_follows'
  end
  get 'users/:id', to: 'users/connections#show', as: 'user'

  post 'users/:id/follows', to: 'follows#create', as: 'user_follows'

  delete 'unfollow/:id', to: 'follows#destroy', as: 'unfollow'

  get 'what_spot', to: 'pages#what_spot'

  root to: 'pages#home'

  get 'map', to: 'maps#show'

  resources :spots, only: [:show, :index, :create, :destroy, :new ] do
    resources :favourites, only: :create
    resources :stories, only: [:index, :new, :show, :create]
  end
  resources :favourites, only: [:index, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
