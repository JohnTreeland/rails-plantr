Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users
  resources :users do
    resources :bookings
    resources :sitters, only: %i[new create edit update destroy]
  end
  get "users/:user_id/sitters", to: "sitters#my_sitters", as: "my_sitters"
  resources :sitters, only: %i[index show]
end
