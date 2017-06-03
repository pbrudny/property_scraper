Rails.application.routes.draw do
  resources :notes
  resources :users
  root 'ads#index'
  resources :ads do
    collection do
      get 'load'
    end
  end
  resources :price_ranges
  resources :districts
  resources :search_links
  resources :sites

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
