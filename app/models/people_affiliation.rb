class PeopleAffiliation < ApplicationRecord
  belongs_to :person
  belongs_to :affiliation
end
