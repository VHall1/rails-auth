module AuthHelpers
  include ActiveSupport::Concern

  def current_user
    @current_user ||= User.find(request.headers['Authorization'])
  end

  def require_admin!
    return if current_user&.admin?

    render json: { error: 'Unauthorized' }, status: :unauthorized
  end
end