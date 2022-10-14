Rails.application.routes.draw do

  devise_for :users
  root "cars#index"

resources :cars do
  resources :reviews
end

resources :likes
resources :profiles
resources :enquiries

get '/company/:brand', to: 'cars#index'
get '/new/buy', to: 'cars#new_buy'


end

