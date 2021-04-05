class ActivityItem < ApplicationRecord
  belongs_to :activity

  validates :item_name, presence: true
  validates :item_status, presence: true, inclusion: { in: %w(pendente finalizado) }
end
