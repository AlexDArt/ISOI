class CreateTransformerSubstations < ActiveRecord::Migration
  def change
    create_table :transformer_substations do |t|
      t.integer :tsnum, null: false, unique: true
      t.text :phones_of_operators, null: false
      t.string :address, null: false
      t.string :power_supply_center
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
