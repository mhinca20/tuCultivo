class Lot < ApplicationRecord
  belongs_to :farm
  has_many :grooves
end
