class ShoppingCenter < ActiveRecord::Base
  belongs_to :boiler_house
  belongs_to :transformer_substation
  belongs_to :water_intake_unit

  validates :scname, presence: true, uniqueness: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      ShoppingCenter.create! row.to_hash
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |shopping_center|
        csv << shopping_center.attributes.values_at(*column_names)
      end
    end
  end

def self.search(params)
     result = ShoppingCenter
     if params['scname'].present?
       result = result.where(scname: params['scname'])
     end
     if params['address'].present?
       result = result.where(address: params['address'])
     end
     if params['number_of_floors'].present?
       result = result.where(number_of_floors: params['number_of_floors'])
     end
     if params['owner'].present?
       result = result.where(owner: params['owner'])
     end
     if params['type_of_roof'].present?
       result = result.where(type_of_roof: params['type_of_roof'])
     end
     if params['number_of_entrances'].present?
       result = result.where(number_of_entrances: params['number_of_entrances'])
     end
     if params['maximum_working_shift'].present?
       result = result.where(maximum_working_shift: params['maximum_working_shift'])
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
     if params['elevator'].present?
       result = result.where(elevator: params['elevator'])
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
