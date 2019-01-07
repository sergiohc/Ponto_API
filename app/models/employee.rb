class Employee < ApplicationRecord
  #extend FriendlyId
  #friendly_id :name, use: :slugged

  belongs_to :office
  belongs_to :team
  belongs_to :user
  has_many :clock_in_out, dependent: :destroy

  validates :name, :cpf, :pis, :team, :user, :office , presence: true

end
