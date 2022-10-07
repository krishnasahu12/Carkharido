Rails.application.routes.draw do

  get 'sells/index'
  get 'enquiries/index'
  get 'profiles/index'
  get 'cars/index'
  get 'homes/index'
  devise_for :users
root to: "homes#index"

resources :cars do
  resources :likes
  get 'cars/buy'
end

resources :reviews
resources :profiles
resources :enquiries
resources :sells
resources :buys
end

