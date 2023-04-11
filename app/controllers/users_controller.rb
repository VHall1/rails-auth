class UsersController < ApplicationController
  before_action :require_admin!
  before_action :set_user, only: %i[ show update destroy assign_group groups ]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def assign_group
    @group = Group.find(params[:group_id])

    if @user.groups.include?(@group)
      render json: { error: 'User already belongs to group' }, status: :unprocessable_entity
    else
      @user.groups << @group
      if @user.save
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  end

  def groups
    render json: @user.groups
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
