# frozen_string_literal: true

class Worker < ApplicationRecord
  belongs_to :clerk
  belongs_to :official

  validates :clerk_id, presence: true
  validates :official_id, presence: true
end
