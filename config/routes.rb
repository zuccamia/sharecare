Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :listings do
    resources :bookings, except: [:destroy]
  end

  get '/listings/:id/profile', to: 'pages#caregiver_profile', as: 'caregiver_profile'
  get '/users/:id/listings', to: 'pages#by_user', as: 'user_listings'
  get '/about_us', to: 'pages#about_us', as: 'about_us'

  get '/users/:id', to: 'pages#profile', as: 'profile'
  post '/users/:id', to: 'bookings#update_status', as: 'status'

end
