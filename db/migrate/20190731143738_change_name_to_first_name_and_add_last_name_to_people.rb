class ChangeNameToFirstNameAndAddLastNameToPeople < ActiveRecord::Migration[5.2]
  def change
    rename_column :people, :name, :first_name
    add_column :people, :last_name, :string
  end
end
