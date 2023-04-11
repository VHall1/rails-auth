class ApplicationController < ActionController::API
  private

  def require_admin!
    return if current_user&.admin?

    render json: { error: 'Unauthorized' }, status: :unauthorized
  end
end
