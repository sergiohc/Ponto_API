class ClockInOut < ApplicationRecord
  extend FriendlyId
  friendly_id :employee_id, use: :slugged
  belongs_to :employee
  #validates_uniqueness_of :date, :scope => "employee_id"
end
