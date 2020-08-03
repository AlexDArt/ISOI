class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :type_of_building, null: false
      t.integer :number_of_floors, null: false
      t.integer :year_of_construction, null: false
      t.string :type_of_roof, null: false
      t.integer :number_of_entrances, null: false
      t.integer :number_of_apartments
      t.integer :number_of_residents
      t.string :gasified
      t.boolean :basement
      t.boolean :attic
      t.boolean :underground_parking
      t.boolean :elevators
      t.boolean :garbage_chute
      t.references :managment_company, index: true, foreign_key: true
      t.references :boiler_house, index: true, foreign_key: true
      t.references :transformer_substation, index: true, foreign_key: true
      t.references :water_intake_unit, index: true, foreign_key: true
      t.string :address, null: false
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
