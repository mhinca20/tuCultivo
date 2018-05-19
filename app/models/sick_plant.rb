class SickPlant < ApplicationRecord
  belongs_to :plague_report
  validates :location, uniqueness: true
end
