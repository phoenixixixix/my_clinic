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
    resources :doctors
    resources :patients
    resources :medical_specialties

    root to: "doctors#index"
  end

  authenticated :user, lambda {|u| u.admin? } do
    root to: "admin/doctors#index", as: :user_root
  end

  authenticated do
    root to: "appointments#index", as: :authenticated_root
  end

  root "welcome#show"
end
