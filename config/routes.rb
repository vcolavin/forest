Rails.application.routes.draw do
  resources :locations, only: [:index]

  root "locations#index"
end
