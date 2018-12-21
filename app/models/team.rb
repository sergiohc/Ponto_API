class Team < ApplicationRecord
  validates :description, presence: true
end
