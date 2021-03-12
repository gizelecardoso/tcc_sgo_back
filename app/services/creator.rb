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
    name = create_login_name(new_official)
    password = create_login_password(new_official)

    Official.create(
      official_code: new_official.official_code,
      official_name: new_official.official_name,
      role_id: new_official.role_id,
      login_name: name,
      login_password: password
    )
  end

  private

  def create_login_name(new_official)
    part_name = @official[:official_name].split(' ')
    new_official.login_name = "#{part_name[0].downcase}.#{part_name[-1].downcase}"
  end

  def create_login_password(new_official)
    new_official.login_password = "sgo#{(SecureRandom.random_number * (10**10)).round}"
  end
end
