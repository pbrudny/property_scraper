Rails.application.routes.draw do
  resources :price_ranges
  resources :districts
  resources :sites
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
