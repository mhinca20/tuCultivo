class Collaboration < ApplicationRecord
  belongs_to :node
  belongs_to :user
end
