class CreateManagmentCompanies < ActiveRecord::Migration
  def change
    create_table :managment_companies do |t|
      t.string :mcname, null: false, unique: true
      t.string :director, null: false
      t.text :phones_of_operators, null: false
      t.text :phones_of_director
      t.string :address, null: false
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
