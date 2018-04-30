class Farm < ApplicationRecord
    has_many :lots. dependent: :destroy
    belongs_to :user
end
