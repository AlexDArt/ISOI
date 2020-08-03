class CreateBoilerHouses < ActiveRecord::Migration
  def change
    create_table :boiler_houses do |t|
      t.string :bhname, null: false, unique: true
      t.text :phones_of_operators, null: false
      t.string :address, null: false
      t.float :latitude
      t.float :longitude
      t.references :water_intake_unit, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
