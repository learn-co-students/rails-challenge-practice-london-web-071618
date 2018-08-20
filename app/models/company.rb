class Company < ApplicationRecord
  has_many :offices
  has_many :buildings, through: :offices
  has_many :employees
  accepts_nested_attributes_for :offices, reject_if: proc { |attributes| attributes['floor'] == "0" }
  validates :name, presence: true


  def rent_paid
    self.offices.map {|o| o.building.rent_per_floor}.inject(:+)
  end

  def offices_attributes=(hash)
    new_hash = {}
    int=0
    hash.values.each do |id_floor|
      if id_floor["floor"] != "0"
        new_hash[int] = id_floor
        int += 1
      end
    end
    new_hash
  end

  def self.clean_data(hash)
    new_hash = {}
    int=0
    hash.values.each do |id_floor|
      if id_floor["floor"] != "0"
        new_hash[int] = id_floor
        int += 1
      end
    end
    new_hash
  end
end
