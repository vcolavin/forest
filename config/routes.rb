Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get "locations", to: 'locations#show'
    end
  end

  root "api/v1/locations#show", defaults: {format: :json}, x: 1, y: 1
end

# Are you looking for the broken thing? This might be the source of the breaking.
Rails.application.routes.named_routes.path_helpers_module.module_eval do
  def locations_path(location = nil, options = {})
    if location
      options.merge!(x: location.x, y: location.y)
    end
    api_v1_locations_path(options)
  end

  def location_path(location = nil, options = {})
    if location
      options.merge!(x: location.x, y: location.y)
    end
    api_v1_locations_path(options)
  end
end
