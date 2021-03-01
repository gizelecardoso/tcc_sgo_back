class Official < ApplicationRecord
    belongs_to :role
    has_many :admins
    has_many :clerks
    has_many :workers
end
