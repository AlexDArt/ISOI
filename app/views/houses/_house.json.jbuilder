json.extract! house, :id, :street, :number, :number_of_floors, :year_of_construction, :type_of_roof, :number_of_entrances, :number_of_apartments, :gasified, :managment_company_id, :boiler_house_id, :transformer_substation_id, :water_intake_unit_id, :coordinates, :created_at, :updated_at
json.url house_url(house, format: :json)
