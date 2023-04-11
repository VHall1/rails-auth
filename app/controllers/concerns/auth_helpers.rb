module AuthHelpers
  include ActiveSupport::Concern

  def current_user
    # TODO: Fix this!
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end

    @current_user
  end

  def require_admin!
    return if current_user&.admin?

    render json: { error: 'Unauthorized' }, status: :unauthorized
  end
end