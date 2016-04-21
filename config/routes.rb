Rails.application.routes.draw do
  get "location", to: 'locations#show'

  root "locations#show"
end
