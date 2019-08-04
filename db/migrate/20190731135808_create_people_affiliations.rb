class CreatePeopleAffiliations < ActiveRecord::Migration[5.2]
  def change
    create_table :people_affiliations do |t|
      t.references :person
      t.references :affiliation

      t.timestamps
    end
  end
end
