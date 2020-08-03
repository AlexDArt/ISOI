class CreateSocialObjects < ActiveRecord::Migration
  def change
    create_table :social_objects do |t|
      t.string :soname, null: false, unique: true
      t.string :type_of, null: false
      t.string :director, null: false
      t.text :superior_organization
      t.text :phones_of_operators, null: false
      t.text :phones_of_director
      t.integer :maximum_working_shift
      t.boolean :attic
      t.boolean :basement
      t.boolean :elevators
      t.boolean :redundant_power_supply
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
