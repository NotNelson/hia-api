Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :people

      resources :aircrafts
      resources :aircraft_types

      resources :flights
      resources :routes
      resources :destinations

      resources :customers do
        resources :bookings
      end

      resources :passengers

      resources :employees do
        resources :maintenances
        resources :rota
      end
    end
  end
end
