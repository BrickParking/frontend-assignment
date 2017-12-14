class Vehicle < ApplicationRecord
  belongs_to :user

  # validations
  validates_presence_of :merk, :handelsbenaming, :eerste_kleur, :license_plate
  validates_uniqueness_of :license_plate
end
