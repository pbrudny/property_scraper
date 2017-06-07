Rails.application.routes.draw do
  resources :appointments
  resources :loads, only: [:index, :show]
  resources :alerts
  resources :statuses
  resources :notes
  resources :users
  root 'ads#index'
  resources :ads do
    resources :appointments, controller: 'ads_appointments'
    collection do
      get 'load'
    end
  end
  resources :price_ranges
  resources :districts

  resources :sites do
    resources :search_links
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
