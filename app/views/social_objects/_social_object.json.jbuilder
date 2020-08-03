json.extract! social_object, :id, :type, :address, :director, :phones_of_operators, :phones_of_director, :boiler_house_id, :transformer_substation_id, :water_intake_unit_id, :coordinates, :created_at, :updated_at
json.url social_object_url(social_object, format: :json)
