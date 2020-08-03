class House < ActiveRecord::Base
  belongs_to :managment_company
  belongs_to :boiler_house
  belongs_to :transformer_substation
  belongs_to :water_intake_unit

  validates :type_of_building, presence: true
  validates :number_of_floors, presence: true
  validates :year_of_construction, presence: true
  validates :type_of_roof, presence: true
  validates :number_of_entrances, presence: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      House.create! row.to_hash
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |house|
        csv << house.attributes.values_at(*column_names)
      end
    end
  end

def self.search(params)
     result = House
     if params['address'].present?
       result = result.where(address: params['address'])
     end
     if params['type_of_building'].present?
       result = result.where(type_of_building: params['type_of_building'])
     end
     if params['number_of_floors'].present?
       result = result.where(number_of_floors: params['number_of_floors'])
     end
     if params['year_of_construction'].present?
       result = result.where(year_of_construction: params['year_of_construction'])
     end
     if params['type_of_roof'].present?
       result = result.where(type_of_roof: params['type_of_roof'])
     end
     if params['number_of_entrances'].present?
       result = result.where(number_of_entrances: params['number_of_entrances'])
     end
     if params['number_of_apartments'].present?
       result = result.where(number_of_apartments: params['number_of_apartments'])
     end
     if params['number_of_residents'].present?
       result = result.where(number_of_residents: params['number_of_residents'])
     end
     if params['basement'].present?
       result = result.where(basement: params['basement'])
     end
     if params['attic'].present?
       result = result.where(attic: params['attic'])
     end
     if params['underground_parking'].present?
       result = result.where(underground_parking: params['underground_parking'])
     end
     if params['elevators'].present?
       result = result.where(elevators: params['elevators'])
     end
     if params['garbage_chute'].present?
       result = result.where(garbage_chute: params['garbage_chute'])
     end
     if params['gasified'].present?
       result = result.where(gasified: params['gasified'])
     end
     if params['latitude'].present?
       result = result.where(latitude: params['latitude'])
     end
     if params['longitude'].present?
       result = result.where(longitude: params['longitude'])
     end

     result.all
  end
end
