class ClockInOut < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :employee
  has_many :answers, dependent: :destroy
end
