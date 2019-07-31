class Person < ApplicationRecord
  has_many :affiliations, through: :people_affiliations
  has_many :locations, through: :people_locations
end
