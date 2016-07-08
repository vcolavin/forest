class ApplicationController < ActionController::API
  include ActionController::ImplicitRender
  include ActionView::Layouts

  rescue_from ActiveRecord::RecordNotFound,       :with => :rescue_404
  rescue_from ActionController::RoutingError,     :with => :rescue_404
  rescue_from ActionController::ParameterMissing, :with => :rescue_400

  private
  def rescue_404(error)
    render json: {status: 404, error: error.message}, status: 404
  end

  def rescue_400(error)
    render json: {status: 400, error: error.message}, status: 400
  end
end
