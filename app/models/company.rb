# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :clerks

  validates :company_code, presence: true, uniqueness: true
  validates :company_name, presence: true, uniqueness: true
  validates :company_branch, presence: true
end
