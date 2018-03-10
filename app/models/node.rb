class Node < ApplicationRecord
  has_many :sensors
  has_many :collaborations, inverse_of: :node
  has_many :users, through: :collaborations
  accepts_nested_attributes_for :collaborations

  
end
