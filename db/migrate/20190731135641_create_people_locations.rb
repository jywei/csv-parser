class CreatePeopleLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :people_locations do |t|
      t.references :person
      t.references :location

      t.timestamps
    end
  end
end
