class Activity < ApplicationRecord
  has_many :activity_items

  validates :activity_code, presence: true, uniqueness: true
  validates :activity_name, presence: true
  validates :activity_description, presence: true
  validates :activity_status, presence: true, inclusion: { in: %w(pendente executando pausada finalizada atrasada cancelada) }
end
