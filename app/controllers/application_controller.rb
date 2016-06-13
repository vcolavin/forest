class ApplicationController < ActionController::API
  include ActionController::ImplicitRender
  include ActionView::Layouts

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  rescue_from ActionController::ParameterMissing, :with => :paramenter_missing

  private
  def record_not_found(error)
    render json: { error: error.message }, status: 404
  end

  def paramenter_missing(error)
    render json: { error: error.message }, status: 400
  end
end
