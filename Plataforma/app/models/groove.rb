class Groove < ApplicationRecord
  belongs_to :lot
  has_many :plague_reports
end
