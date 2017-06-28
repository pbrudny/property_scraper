Rails.application.routes.draw do
  resources :appointments
  resources :loads, only: [:index, :show]
  resources :alerts
  resources :users
  root 'ads#index'
  resources :ads do
    resources :appointments, controller: 'ads_appointments'
    resources :notes, controller: 'ads_notes'
    collection do
      get 'load'
    end
    member do
      put 'interesting'
      put 'not_interesting'
      put 'in_progress'
      put 'accepted'
      put 'rejected'
    end
  end
  resources :price_ranges
  resources :districts

  resources :sites do
    resources :search_links
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
