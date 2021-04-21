# frozen_string_literal: true

class Official < ApplicationRecord
  has_secure_password
  belongs_to :role
  belongs_to :company
  belongs_to :clerk, class_name: 'Official', foreign_key: :clerk_id
  has_many :officials, class_name: 'Official', foreign_key: :id
  has_many :activities

  validates :official_code, presence: true, uniqueness: true
  validates :official_name, presence: true, uniqueness: true
  validates :role_id, presence: true
  validates :company_id, presence: true
end
