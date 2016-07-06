require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Forest
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.autoload_paths += %W(#{config.root}/lib)

    # Otherwise & is turned into "\u0026" in JSON responses
    config.active_support.escape_html_entities_in_json = false
  end
end
