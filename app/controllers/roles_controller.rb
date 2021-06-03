# frozen_string_literal: true

# Contoller Roles
class RolesController < ApplicationController
  before_action :authorized, only: [:auto_login]

  def index
    render json: Role.all.order('role_name')
  end

  def show
    role = Role.where(id: params[:id]).first
    if role.present?
      render json: role
    else
      render json: '', status: 404
    end
  end

  def create
    role = Role.create(role_params)

    render json: role, status: 201
  end

  def update
    role = Role.find(params[:id])
    role.update(role_params)

    render json: role, status: 200
  end

  def destroy
    role = Role.find(params[:id])
    role.delete
    render json: '', status: 204
  end

  private

  def role_params
    params.require(:role).permit(:role_code, :role_name, :role_description, :role_category)
  end
end
