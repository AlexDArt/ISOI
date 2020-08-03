class SocialObject < ActiveRecord::Base
  belongs_to :boiler_house
  belongs_to :transformer_substation
  belongs_to :water_intake_unit

  validates :soname, presence: true, uniqueness: true
  validates :type_of, presence: true
  validates :director, presence: true
  validates :phones_of_operators, presence: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      SocialObject.create! row.to_hash
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |social_object|
        csv << social_object.attributes.values_at(*column_names)
      end
    end
  end

  def self.search(params)
     result = SocialObject
     if params['soname'].present?
       result = result.where(soname: params['soname'])
     end
     if params['type_of'].present?
       result = result.where(type_of: params['type_of'])
     end
     if params['redundant_power_supply'].present?
       result = result.where(redundant_power_supply: params['redundant_power_supply'])
     end
     if params['maximum_working_shift'].present?
       result = result.where(maximum_working_shift: params['maximum_working_shift'])
     end
     if params['superior_organization'].present?
       result = result.where(superior_organization: params['superior_organization'])
     end
     if params['basement'].present?
       result = result.where(basement: params['basement'])
     end
     if params['attic'].present?
       result = result.where(attic: params['attic'])
     end
     if params['elevators'].present?
       result = result.where(elevators: params['elevators'])
     end
     if params['director'].present?
       result = result.where(director: params['director'])
     end
     if params['phones_of_director'].present?
       result = result.where(phones_of_director: params['phones_of_director'])
     end
     if params['address'].present?
       result = result.where(address: params['address'])
     end
     if params['phones_of_operators'].present?
       result = result.where(phones_of_operators: params['phones_of_operators'])
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
