class ActivitiesController < ApplicationController
  before_action :authorized, only: [:auto_login]

  def index
    render json: Activity.all
  end

  def show
    activity = Activity.where(id: params[:id]).first
    if activity.present?
      render json: activity
    else
      render json: '', status: 404
    end
  end

  def create
    activity = Activity.create!(activities_params)

    render json: activity, status: 201
  end

  def update
    activity = find_activity
    activity.update!(activities_params)

    render json: activity, status: 200
  end

  def destroy
    activity = find_activity
    activity.destroy!

    render json: '', status: 204
  end

  private

  def find_activity
    Activity.find(params[:id])
  end

  def activities_params
    params.require(:activity).permit(:activity_code, :activity_name, :activity_description,
                                     :activity_status, :expected_initial_date, :expected_final_date, :official_id)
  end
end
