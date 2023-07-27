class UserGroupsController < ApplicationController
  before_action :require_admin!
  before_action :set_user
  before_action :set_user_group, only: %i[ destroy ]

  # GEt /users/:user_id/groups
  def index
    render json: @user.groups
  end

  # POST /users/:user_id/groups
  def create
    @user_group = @user.user_groups.new(user_group_params)

    if @user_group.save
      render json: @user_group, status: :created, location: @user
    else
      render json: @user_group.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/:user_id/groups/:id
  def destroy
    @user_group.destroy
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_user_group
    @user_group = @user&.groups&.find(params[:id])
  end

  def user_group_params
    params.permit(:group_id)
  end
end
