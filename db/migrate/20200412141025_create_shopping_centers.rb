class CreateShoppingCenters < ActiveRecord::Migration
  def change
    create_table :shopping_centers do |t|
      t.string :address, null: false, unique: true
      t.string :scname, null: false, unique: true
      t.text :owner
      t.integer :number_of_floors
      t.string :type_of_roof
      t.integer :number_of_entrances
      t.integer :maximum_working_shift
      t.boolean :basement
      t.boolean :attic
      t.boolean :underground_parking
      t.boolean :elevator
      t.references :boiler_house, index: true, foreign_key: true
      t.references :transformer_substation, index: true, foreign_key: true
      t.references :water_intake_unit, index: true, foreign_key: true
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
