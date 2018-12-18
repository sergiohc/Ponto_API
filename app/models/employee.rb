class Employee < ApplicationRecord
  belongs_to :office
  belongs_to :team
  belongs_to :user
end
