Rails.application.routes.draw do
  devise_for :listeners
  devise_for :artists
  root "posts#index"
  resources :posts
end
