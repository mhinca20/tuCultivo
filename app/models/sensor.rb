class Sensor < ApplicationRecord
  belongs_to :node
  has_many :values
end
