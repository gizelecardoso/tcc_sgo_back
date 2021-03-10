# frozen_string_literal: true

class Official < ApplicationRecord
  belongs_to :role
  has_many :admins
  has_many :clerks
  has_many :workers

  validates :official_code, presence: true, uniqueness: true
  validates :official_name, presence: true, uniqueness: true
  validates :role_id, presence: true
end
