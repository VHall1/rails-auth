class AuthController < ApplicationController
  def register
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      render json: { token: }
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
  end

  def me
    render json: current_user
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
