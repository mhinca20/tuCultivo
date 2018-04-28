class Farm < ApplicationRecord
    has_many :lots
    belongs_to :user
end
