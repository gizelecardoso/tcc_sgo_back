# frozen_string_literal: true

class Clerk < ApplicationRecord
  belongs_to :company
  belongs_to :official
  has_many :workers

  validates :company_id, presence: true
  validates :official_id, presence: true
end
