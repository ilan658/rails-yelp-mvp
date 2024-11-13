Rails.application.routes.draw do
  # Route de santé de l'application
  get "up" => "rails/health#show", as: :rails_health_check

  root "restaurants#index"

  # Routes pour les restaurants
  resources :restaurants, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:create] # Supprime la route GET pour new
  end
end
