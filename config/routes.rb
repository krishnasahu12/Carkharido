Rails.application.routes.draw do

  devise_for :users
  root "cars#index"

resources :cars do
  resources :reviews
end

resources :likes
resources :profiles
resources :enquiries

get '/company/:brand', to: 'cars#new_buy'
get '/new/buy', to: 'cars#new_buy'
get '/my/car', to: 'cars#my_car'


end

