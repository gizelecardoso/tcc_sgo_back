# frozen_string_literal: true

# Contoller Companies
class CompaniesController < ApplicationController
  def index
    render json: Company.all
  end

  def show
    company = Company.where(id: params[:id]).first
    if company.present?
      render json: company
    else
      render json: '', status: 404
    end
  end

  def create
    company = Company.create(params.require(:company).permit(:company_code, :company_name, :company_branch))

    render json: company, status: 201
  end

  def update
    company = Company.find(params[:id])
    company.update(params.require(:company).permit(:company_code, :company_name, :company_branch))

    render json: company, status: 200
  end

  def destroy
    company = Company.find(params[:id])
    company.delete
    render json: '', status: 204
  end
end
