class Building < ApplicationRecord
  has_many :offices
  has_many :companies, through: :offices


  def available_floors
    arr = []
    (1..self.number_of_floors).each { |i| arr << i }
    taken_floors = self.offices.map {|office| office.floor}
    arr - taken_floors
  end


end
