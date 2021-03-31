# frozen_string_literal: true

class Role < ApplicationRecord
  has_many :officials

  validates :role_code, presence: true, uniqueness: true
  validates :role_name, presence: true, uniqueness: true
  validates :role_description, presence: true
  validates :role_category, presence: true, inclusion: { in: %w(administrador encarregado oficial) }
end
