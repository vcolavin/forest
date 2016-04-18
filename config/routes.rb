Rails.application.routes.draw do
  resources :locations, only: [:show, :index]

  root "locations#index"
end
