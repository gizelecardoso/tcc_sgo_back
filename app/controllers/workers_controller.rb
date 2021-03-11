# frozen_string_literal: true

# Contoller Workers
class WorkersController < ApplicationController
  def index
    render json: Worker.all
  end

  def show
    worker = Worker.where(id: params[:id]).first
    if worker.present?
      render json: worker
    else
      render json: '', status: 404
    end
  end

  def create
    worker = Worker.create(params.require(:worker).permit(:clerk_id, :official_id))

    render json: worker, status: 201
  end

  def update
    worker = Worker.find(params[:id])
    worker.update(params.require(:worker).permit(:clerk_id, :official_id))

    render json: worker, status: 200
  end

  def destroy
    worker = Worker.find(params[:id])
    worker.delete

    render json: '', status: 204
  end
end
