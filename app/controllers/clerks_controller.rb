# frozen_string_literal: true

# Contoller Clerks
class ClerksController < ApplicationController
  before_action :authorized, only: [:auto_login]

  def index
    # render json: Clerk.all
    clerks = Clerk.all
    lista = []
    clerks.each do |clerk|
      lista << { name: clerk.official.official_name, id: clerk.id }
    end
    render json: lista
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
