class Employee < ApplicationRecord
  #extend FriendlyId
  #friendly_id :name, use: :slugged
  belongs_to :user
  has_many :clock_in_out, dependent: :destroy

  validates :name, :pis, presence: true
end
