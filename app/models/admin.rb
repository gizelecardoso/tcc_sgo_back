# frozen_string_literal: true

class Admin < ApplicationRecord
  belongs_to :official

  validates :official_id, presence: true
end
