class Worker < ApplicationRecord
    belongs_to :clerk
    belongs_to :official
end
