module AuthHelpers
  include ActiveSupport::Concern

  def current_user
    if (token = request.headers['Authorization'])
      decoded = JsonWebToken.decode(token)
      @current_user ||= User.find_by_id(decoded[:user_id])
    end

    @current_user
  end

  def require_admin!
    return if current_user&.admin?

    render json: { error: 'Unauthorized' }, status: :unauthorized
  end
end
