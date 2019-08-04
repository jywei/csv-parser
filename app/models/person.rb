class Person < ApplicationRecord
  has_many :people_affiliations
  has_many :people_locations
  has_many :affiliations, through: :people_affiliations
  has_many :locations, through: :people_locations

  validates :first_name, presence: true
  validates :species, presence: true
  validates :gender, presence: true
  validates :weapon, presence: true
  validates :vehicle, presence: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      ActiveRecord::Base.transaction do
        name = row['Name']
        content = {}
        content[:first_name] = (name.split.count > 1 ? name.split[0..-2].join(' ') : name).capitalize
        content[:last_name]  = name.split.last.capitalize if name.split.count > 1
        content[:species]    = row['Species']
        content[:gender]     = row['Gender']
        content[:weapon]     = row['Weapon']
        content[:vehicle]    = row['Vehicle']
        person = new(content)
        next unless person.valid?
        person.save!

        # binding.pry

        locations = row['Location'].split(',')
        locations.each do |location|
          location = location.strip
          person.locations << Location.find_or_create_by(name: location.capitalize)
        end
        next unless row['Affiliations'].present?
        affiliations = row['Affiliations'].split(',')
        affiliations.each do |affiliation|
          person.affiliations << Affiliation.find_or_create_by(name: affiliation.capitalize)
        end
      end
    end
  end
end
