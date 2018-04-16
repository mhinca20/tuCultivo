class Sensor < ApplicationRecord
  belongs_to :node
  has_many :values, dependent: :destroy
end
