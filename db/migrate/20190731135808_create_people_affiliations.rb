class CreatePeopleAffiliations < ActiveRecord::Migration[5.2]
  def change
    create_table :people_affiliations do |t|
      t.references :people

      t.timestamps
    end
  end
end
