class Office < ApplicationRecord
  belongs_to :building
  belongs_to :company
  has_many :contracts
  has_many :employees, through: :contracts
  validates :floor, numericality: { only_integer: true }

end
