Rails.application.routes.draw do
  root "homes#index"
  devise_for :users

  resources :homes
  resources :users
  resources :bookings do
    resources :items
      member do
        patch :change_status
        # get :change_status
      end
  end
end