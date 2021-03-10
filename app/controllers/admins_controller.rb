# frozen_string_literal: true

# Contoller Admins
class AdminsController < ApplicationController
  def index
    render json: Admin.all
  end

  def show
    admin = Admin.where(id: params[:id]).first
    if admin.present?
      render json: admin
    else
      render json: '', status: 404
    end
  end

  def create
    admin = Admin.create(params.require(:admin).permit(:official))

    render json: admin, status: 201
  end

  def update
    admin = Admin.find(params[:id])
    admin.update(params.require(:admin).permit(:official))

    render json: admin, status: 200
  end

  def destroy
    admin = Admin.find(params[:id])
    admin.delete
    
    render json: '', status: 204
  end
end
