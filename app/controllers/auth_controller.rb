class AuthController < ApplicationController
  def register
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(email: params[:email])

    # TODO: Return token instead of user
    if @user && @user.authenticate(params[:password])
      render json: @user
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
