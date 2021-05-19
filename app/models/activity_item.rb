class ActivityItem < ApplicationRecord
  belongs_to :activity

  validates :item_name, presence: true
  validates :item_status, presence: true, inclusion: { in: %w(pendente finalizado) }

  after_create do
    activity.calcula_evolucao
  end

  after_destroy do
    activity.calcula_evolucao
  end

  after_update do
    activity.calcula_evolucao
  end
end
