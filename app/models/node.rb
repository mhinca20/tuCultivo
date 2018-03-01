class Node < ApplicationRecord
  has_many :sensors
  has_many :collaborations
  has_many :users, :through => :collaborations

  
end
