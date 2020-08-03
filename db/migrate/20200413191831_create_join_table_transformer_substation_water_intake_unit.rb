class CreateJoinTableTransformerSubstationWaterIntakeUnit < ActiveRecord::Migration
  def change
    create_join_table :transformer_substations, :water_intake_units do |t|
      t.index [:transformer_substation_id, :water_intake_unit_id], unique: true, name: 'idx_transformer_water'
      # t.index [:water_intake_unit_id, :transformer_substation_id]
    end
  end
end
