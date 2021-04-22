# frozen_string_literal: true

# Model to activities with some validations
class Activity < ApplicationRecord
  has_many :activity_items
  belongs_to :official

  validates :activity_code, presence: true, uniqueness: true
  validates :activity_name, presence: true
  validates :activity_description, presence: true
  validates :activity_status, presence: true,
                              inclusion: { in: %w[nova pendente executando pausada finalizada atrasada cancelada] }
  validate :validated_status

  # before_update :validated_status

  before_create do
    self.activity_status = 'nova'
  end

  private

  def validated_status
    return if id.nil?

    status = Activity.find(id).activity_status

    if status == 'pendente' && %w[pendente executando].exclude?(activity_status)
      errors.add(:activity_status, 'status can be executing or pending')
    end

    if status == 'executando' && %w[executando pausada finalizada cancelada].exclude?(activity_status)
      errors.add(:activity_status, 'status can be executing or late or finished')
    end

    if status == 'pausada' && %w[executando pausada cancelada].exclude?(activity_status)
      errors.add(:activity_status, 'status can be executing or canceled')
    end

    if status == 'atrasada' && %w[finalizada atrasada cancelada].exclude?(activity_status)
      errors.add(:activity_status, 'status can be canceled or fineshed')
    end

    errors.add(:activity_status, 'status can be pending') if status == 'nova' && activity_status != 'pendente'

    errors.add(:activity_status, 'status cant be changed') if status == 'cancelada'

    errors.add(:activity_status, 'status cant be changed') if status == 'finalizada' && activity_status != 'finalizada'
  end

  # def before_create
  #   activity_status = 'nova'
  #   super
  # end
end
