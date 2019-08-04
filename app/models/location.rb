class Location < ApplicationRecord
  has_many :people, through: :people_locations

  validates :name, presence: true
end
