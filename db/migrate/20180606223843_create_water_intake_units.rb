class CreateWaterIntakeUnits < ActiveRecord::Migration
  def change
    create_table :water_intake_units do |t|
      t.integer :wiunum, null: false, unique: true
      t.text :phones_of_operators, null: false
      t.string :address, null: false
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
