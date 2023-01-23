Rails.application.routes.draw do
  root "homes#index"
  devise_for :users

  get '/about_us', to: "homes#about_us"
  get '/service', to: "homes#service"
  get '/contact_us', to: "homes#contact_us"

  resources :users
  resources :bookings do
  resources :bills
    resources :items
      member do
        patch :change_status
        get :change_status
      end
  end
end