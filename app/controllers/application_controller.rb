class ApplicationController < ActionController::API
  include ActionController::ImplicitRender
  include ActionView::Layouts

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  rescue_from ActionController::ParameterMissing, :with => :poorly_formed_request

  private
  def record_not_found(error)
    render json: { error: error.message }, status: 404
  end

  def poorly_formed_request(error)
    render json: { error: error.message }, status: 400
  end
end
