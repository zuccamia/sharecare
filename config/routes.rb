Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :listings do
    resources :bookings, except: [:destroy]
  end

  get '/listings/:id/profile', to: 'pages#profile', as: 'caregiver_profile'

  get '/listings/:listing_id/bookings', to: 'bookings#show', as: 'bookings_show'

end
