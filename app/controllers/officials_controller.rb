# frozen_string_literal: true

# Contoller Officials
class OfficialsController < ApplicationController
  before_action :authorized, only: [:auto_login]

  def index
    if params[:only_clerks] == 'true'
      roles = Role.where(role_category: 'encarregado')
      render json: Official.where(role: roles)
    elsif params[:only_official] == 'true'
      roles = Role.where(role_category: 'oficial')
      if params[:clerk_id].present?
        officials = Official.where(role: roles, clerk_id: params[:clerk_id].to_i)
      else
        officials = Official.where(role: roles)
      end
      if params[:free] == 'true'
        free_official = officials.all.reject do |official|
          Activity.where(official_id: official.id, activity_status: ['pendente', 'executando', 'pausada', 'atrasada']).present?
        end
        if params[:delegate] == 'true'
          official = Official.where(id: params[:id]).first
          free_official << official
        end
        return render json: free_official
      end
      render json: officials
    else
      render json: Official.all
    end
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
    @category =  @official.role.role_category

    if @official && @official.authenticate(params[:password])
      token = encode_token({ official_id: @official.id })
      render json: { official: @official, token: token, category: @category }
    else
      render json: { error: 'Usuario ou senha invalidos' }, status: :unauthorized
    end
  end

  def auto_login
    render json: @official
  end

  private

  def official_params
    params.require(:official).permit(:official_code, :official_name, :cellphone, :role_id, :company_id, :clerk_id)
  end

  def create_relation(official_params, official)
    clerk = ::RelationshipCreator.call(official_params, official)
  end
end
