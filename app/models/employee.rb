class Employee < ApplicationRecord
  belongs_to :company
  has_one :contract
  has_one :office, through: :contract
  validates :name, length: {minimum: 5}
end
