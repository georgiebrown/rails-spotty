Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'map', to: 'maps#show'




  resources :spots, only: [:show, :index ] do
    resources :favourites, only: :create
    resources :stories, only: [:new, :show, :create]
  end

  resources :favourites, only: [:index, :new, :show, :destroy ]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
