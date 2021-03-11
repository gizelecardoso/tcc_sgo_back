# frozen_string_literal: true

# Application to make better Services
class ApplicationService
  def self.call(*args, &block)
    new(*args, &block).call
  end
end
