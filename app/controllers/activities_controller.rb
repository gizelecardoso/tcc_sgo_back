class ActivitiesController < ApplicationController
  before_action :authorized, only: [:auto_login]

  def index
    if params[:late] == 'true' && params[:category] == 'administrador'
      validated_late_activity
      activities = Activity.where(activity_status: %w[pausada atrasada]).order('expected_initial_date')
      render json: activities
    elsif params[:category] == 'oficial'
      activities = Activity.where(official_id: params[:official_id]).order('expected_initial_date')
      render json: activities
    elsif params[:category] == 'encarregado'
      official_ids = Official.where(clerk_id: params[:official_id]).map(&:id)
      if params[:late] == 'true'
        validated_late_activity
        activities = Activity.where(official_id: official_ids, activity_status: %w[pausada atrasada]).order('expected_initial_date')
      else
        activities = Activity.where(official_id: official_ids).order('expected_initial_date DESC')
      end
      render json: activities
    elsif params[:only_one] == 'true'
      activity = Activity.where(official_id: params[:official_id], 'activity_status': %w[pendente executando atrasada pausada]).first
      render json: activity
    elsif params[:evolution] == 'true'
      render json: Activity.where(id: params[:id]).first.evolution
    else
      render json: Activity.all.order('expected_initial_date')
    end
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
  rescue Exception => ex
    puts "Houve um erro: " + ex.message
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
                                     :activity_status, :expected_initial_date, :expected_final_date, :official_id,
                                     :final_date, :stopped_date, :initial_date, :reason_to_stop)
  end

  def validated_late_activity
    hoje = Time.current
    Activity.where('activity_status': %w[pendente executando pausada atrasada]).and(Activity.where('expected_final_date < ?', hoje)).each do |activity|
      activity.update!(activity_status: 'atrasada')
    end
  end
end
