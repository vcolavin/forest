Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get "locations", to: 'locations#show'
      get "location" , to: 'locations#show'
    end
  end

  root "api/v1/locations#show", defaults: {format: :json}, x: 1, y: 1
end
