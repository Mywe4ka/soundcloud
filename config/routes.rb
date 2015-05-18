Sound::Application.routes.draw do

  resources :users, only: [:show, :edit, :update]

  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

  root to: 'home#index'

end
