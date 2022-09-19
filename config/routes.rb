Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "patients/registrations"
  }
  resources :patients, only: [:show]
  resources :doctors, only: [:show, :index]
  resources :appointments, only: [:show, :create, :index] do
    resource :recommendations, only: [:new, :create]
  end

  namespace :admin do
    resources :recommendations
    resources :medical_specialties
    resources :appointments
    resources :users
    resources :patients
    resources :doctors

    root to: "recommendations#index"
  end

  authenticated do
    root to: "appointments#index", as: :authenticated_root
  end

  root "welcome#show"
end
