Sound::Application.routes.draw do

  resources :users do
    resources :playlists
    member do
      get :following, :followers
    end
  end

  resources :songs do
    collection do
      post 'upload'
    end
  end

  resources :relationships, only: [:create, :destroy]

  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

  root to: 'home#index'

end
