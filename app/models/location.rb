class Location < ApplicationRecord
  has_many :people, through: :people_affiliations
end
