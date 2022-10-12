Rails.application.routes.draw do

  devise_for :users
  root "cars#index"

resources :cars do
  resources :reviews
end

resources :likes
resources :profiles
resources :enquiries
end

