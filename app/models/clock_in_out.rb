class ClockInOut < ApplicationRecord
  belongs_to :employee
  scope :day, -> { where(status: true) }
end
