Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    scope module: :v1 do
      get "locations", to: 'locations#show'
      get "location" , to: 'locations#show'
    end
  end

  root "locations#show", defaults: {format: :json}
end
