class Clerk < ApplicationRecord
    belongs_to :company
    belongs_to :official
    has_many :workers
end
