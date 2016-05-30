Rails.application.routes.draw do
  get "locations", to: 'locations#show', defaults: {format: :json}
  get "location" , to: 'locations#show', defaults: {format: :json}

  root "locations#show", defaults: {format: :json}
end
