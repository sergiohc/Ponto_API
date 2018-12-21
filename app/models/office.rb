class Office < ApplicationRecord
  validates :description, presence: true
end
