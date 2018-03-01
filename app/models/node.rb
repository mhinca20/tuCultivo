class Node < ApplicationRecord
  has_many :sensors
  has_and_belongs_to_many :users
end
