Sound::Application.routes.draw do

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :playlists do
    collection do
      get 'add_song'
    end
  end

  resources :songs do
    collection do
      post 'upload'
      get 'comments'
    end
  end

  resources :relationships, only: [:create, :destroy]

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  root to: 'home#index'
  mount Resque::Server, :at => "/resque"

end
