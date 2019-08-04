class Affiliation < ApplicationRecord
  has_many :people, through: :people_affiliations

  validates :name, presence: true
end
