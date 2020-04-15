Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get 'person-exists' => 'people#person_exists'
      get 'list-passengers' => 'passengers#list_passengers'

      resources :people

      resources :aircrafts, :path => "aircraft"
      resources :aircraft_types

      resources :flights
      resources :routes
      resources :destinations

      resources :customers do
        resources :bookings
      end

      resources :passengers

      resources :employees do
        resources :maintenances, :path => "maintenance"
        resources :rota
      end
    end
  end
end
