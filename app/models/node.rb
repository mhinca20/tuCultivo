class Node < ApplicationRecord
  has_many :sensors, dependent: :destroy
  accepts_nested_attributes_for :sensors
  
  has_many :collaborations, inverse_of: :node
  has_many :users, through: :collaborations
  accepts_nested_attributes_for :collaborations


end
