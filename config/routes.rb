Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users do
    resources :sitters, only: %i[new create edit
  end

  patch "sitters/:id", to: "sitters#update", as: :update_sitter

  get "users/:user_id/sitters", to: "sitters#my_sitters", as: "my_sitters"

  resources :sitters, only: %i[index show] do
    resources :bookings, only: %i[new create edit update]
  end

  resources :bookings, only: %i[index show]

  resources :bookings, only: :destroy
  delete '/sitters/:id', to: 'sitters#destroy'

end
