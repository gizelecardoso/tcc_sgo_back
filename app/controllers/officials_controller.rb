# frozen_string_literal: true

# Contoller Officials
class OfficialsController < ApplicationController
  before_action :authorized, only: [:auto_login]

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
    @official = ::Creator.call(official_params)
    # byebug
    # clerk = create_relation(params, @official)
    if @official.valid?
      token = encode_token({ official_id: @official.id })
      render json: { official: @official, token: token }, status: 201
    else
      render json: { error: 'Usuario ou senha invalidos' }
    end
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

  def login
    @official = Official.find_by(login_name: params[:login_name])

    if @official && @official.authenticate(params[:password])
      token = encode_token({ official_id: @official.id })
      render json: { official: @official, token: token }
    else
      render json: { error: 'Usuario ou senha invalidos' }, status: :unauthorized
    end
  end

  def auto_login
    render json: @official
  end

  private

  def official_params
    params.require(:official).permit(:official_code, :official_name, :role_id, :category, :relation_id)
  end

  def create_relation(official_params, official)
    clerk = ::RelationshipCreator.call(official_params, official)
  end
end
