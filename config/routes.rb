Rails.application.routes.draw do
  devise_for :artists, controllers: {
    sessions: 'artists/sessions',
    passwords: 'artists/passwords',
    registrations: 'artists/registrations'
  }

  devise_for :listeners, controllers: {
    sessions: 'listeners/sessions',
    passwords: 'listeners/passwords',
    registrations: 'listeners/registrations'
  }
  root "posts#index"
  resources :posts do
    resource :comments, only: [:create]
    resource :favorites, only: [:create, :destroy]
    get :favoritesindex, on: :collection
  end
  resources :artistshow, only: [:show] do
    resource :followartists, only: [:create, :destroy]
  end
  resources :listenershow, only: [:show]
  resources :relationships, only: [:create, :destroy]
end
