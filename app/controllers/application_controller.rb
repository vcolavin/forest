class ApplicationController < ActionController::API
  # This allows JBuilder "views" to be rendered implicitly
  include ActionController::ImplicitRender
  include ActionView::Layouts
end
