class CreateJoinTableBoilerHouseTransformerSubstation < ActiveRecord::Migration
  def change
    create_join_table :boiler_houses, :transformer_substations do |t|
      t.index [:boiler_house_id, :transformer_substation_id], unique: true, name: 'idx_boiler_transformer'
      # t.index [:transformer_substation_id, :boiler_house_id]
    end
  end
end
