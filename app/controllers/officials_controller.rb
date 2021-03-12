# frozen_string_literal: true

# Contoller Officials
class OfficialsController < ApplicationController
  def index
    render json: Official.all
  end

  def show
    official = Official.where(id: params[:id]).first
    if official.present?
      render json: official
    else
      render json: '', status: 404
    end
  end

  def create
    official = ::Creator.call(official_params)
    render json: official, status: 201
  end

  def update
    official = Official.find(params[:id])
    official.update(official_params)

    render json: official, status: 200
  end

  def destroy
    official = Official.find(params[:id])
    official.delete
    render json: '', status: 204
  end

  def official_params
    params.require(:official).permit(:official_code, :official_name, :role_id)
  end

end