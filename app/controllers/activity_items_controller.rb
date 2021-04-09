class ActivityItemsController < ApplicationController
  before_action :authorized, only: [:auto_login]

  def index
    items = ActivityItem.where(activity_id: params[:activity_id])
    render json: items
  end

  def show
    item = ActivityItem.where(id: params[:id]).first
    if item.present?
      render json: item
    else
      render json: '', status: 404
    end
  end

  def create
    item = ActivityItem.create!(item_params)

    render json: item, status: 201
  end

  def update
    item = find_item
    item.update(item_params)

    render json: item, status: 200
  end

  def destroy
    item = find_item
    item.destroy!

    render json: '', status: 204
  end

  private

  def find_item
    ActivityItem.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:item_name, :item_status, :activity_id)
  end
end

