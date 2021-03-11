# frozen_string_literal: true

require 'securerandom'

# Service to create datas to login
class Creator < ApplicationService
  def initialize(official_params)
    super()
    @official = official_params
  end

  def call
    new_official = Official.new(@official)

    Official.create(
      official_code: new_official.official_code,
      official_name: new_official.official_name,
      clerk_id: new_official.clerk_id,
      login_name: create_login_name(new_official),
      login_password: create_login_password(new_official)
    )
  end

  private

  def create_login_name(_official)
    part_name = @official[:official_name].split('')
    `#{part_name.first.downcase}.#{part_name.last.downcase}`
  end

  def create_login_password(_official)
    `sgo#{(SecureRandom.random_number * (10**10)).round}`
  end
end

