# frozen_string_literal: true

# Model to activities with some validations
class Activity < ApplicationRecord
  has_many :activity_items
  belongs_to :official, optional: true

  validates :activity_code, presence: true, uniqueness: true
  validates :activity_name, presence: true
  validates :activity_description, presence: true
  validates :activity_status, presence: true,
                              inclusion: { in: %w[nova pendente executando pausada finalizada atrasada cancelada] }
  validate :validated_status
  # validates :expected_initial_date, presence: true, comparison: { less_than: :expected_final_date }
  # validates :final_date, comparison: { greater_than: :initial_date }

  # before_update :validated_status

  validate :validated_date?
  # validate :validated_late_activity

  before_create do
    self.activity_status = 'nova'
  end

  def calcula_evolucao
    todos = activity_items.all
    total = todos.size.to_f

    realizado = todos.select { |p| p.item_status == 'finalizado' }.size

    self.evolution = realizado / total * 100
    save
  end

  # def calcula_desempenho
  #   if DateTime.current <= expected_final_date
  #     self.desempenho = self.evolution
  #   else
  #     self.desempenho = self.evolution
  #     self.desempenho = self.desempenho - self.desempenho * 10/100 (DateTime.current - expected_final_date)
  #   end
  # end

  private
  # def validated_late_activity
  #   hoje = Time.current
  #   Activity.where(%w[nova pendente executando parada].include?(activity_status), 'expected_final_date < ?', hoje).update(activity_status: 'atrasado')
  # end

  def validated_date?
    unless expected_final_date.after?(expected_initial_date)
      errors.add(:expected_initial_date, 'must be before Expected Final Date')
      errors.add(:expected_final_date, 'must be after Expected Initial Date')
    end
    return unless final_date.present?

    unless final_date.after?(initial_date)
      errors.add(:initial_date, 'must be before Final Date')
      errors.add(:final_date, 'must be after Initial Date')
    end
  end

  def validated_status
    return if id.nil?

    status = Activity.find(id).activity_status

    if status == 'pendente' && %w[pendente executando atrasada].exclude?(activity_status)
      errors.add(:activity_status, 'status must be pending or executing or late')
    end

    if status == 'executando' && %w[executando pausada finalizada cancelada atrasada].exclude?(activity_status)
      errors.add(:activity_status, 'status must be executing or stopped or finished or canceled or late')
    end

    if status == 'pausada' && %w[executando pausada cancelada atrasada].exclude?(activity_status)
      errors.add(:activity_status, 'status must be executing or stopped or canceled or late')
    end

    if status == 'atrasada' && %w[pausada finalizada atrasada cancelada].exclude?(activity_status)
      errors.add(:activity_status, 'status must be stopped or fineshed or late or canceled')
    end

    if status == 'nova' && %w[nova pendente].exclude?(activity_status)
      errors.add(:activity_status, 'status must be new or pending or late or canceled')
    end

    errors.add(:activity_status, 'status mustnt be changed') if status == 'cancelada'

    errors.add(:activity_status, 'status cant be changed') if status == 'finalizada' && activity_status != 'finalizada'
  end



  # def before_create
  #   activity_status = 'nova'
  #   super
  # end
end
