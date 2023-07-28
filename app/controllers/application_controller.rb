class ApplicationController < ActionController::API
  include AuthHelpers

  private

  def record_not_found(model)
    render json: { errors: { model.to_sym => ['must exist'] } }, status: :not_found
  end
end
