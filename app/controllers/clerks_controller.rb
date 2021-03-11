# frozen_string_literal: true

# Contoller Clerks
class ClerksController < ApplicationController
  def index
    render json: Clerk.all
  end

  def show
    clerk = Clerk.where(id: params[:id]).first
    if clerk.present?
      render json: clerk
    else
      render json: '', status: 404
    end
  end

  def create
    clerk = Clerk.create(params.require(:clerk).permit(:company_id, :official_id))

    render json: clerk, status: 201
  end

  def update
    clerk = Clerk.where(id: params[:id]).first
    clerk.update(params.require(:clerk).permit(:company_id, :official_id))

    render json: clerk, status: 200
  end

  def destroy
    clerk = Clerk.find(id: params[:id])
    clerk.delete
    render json: '', status: 204
  end
end
