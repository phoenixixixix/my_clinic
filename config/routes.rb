Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "patients/registrations"
  }
  resources :patients, only: [:show]
  resources :doctors, only: [:show, :index]
  resources :appointments, only: [:show, :create, :index] do
    resource :recommendations, only: [:new, :create]
  end

  authenticated do
    root to: "appointments#index", as: :authenticated_root
  end

  root "welcome#show"
end
