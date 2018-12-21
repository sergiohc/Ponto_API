class ClockInOut < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :employee
end
