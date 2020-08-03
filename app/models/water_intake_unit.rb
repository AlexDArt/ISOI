class WaterIntakeUnit < ActiveRecord::Base 
  has_and_belongs_to_many :transformer_substations
  has_many :houses
  has_many :social_objects
  has_many :shopping_centers
  has_many :boiler_houses

  validates :wiunum, presence: true, uniqueness: true
  validates :phones_of_operators, presence: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode

  accepts_nested_attributes_for :transformer_substations
  before_save do
    self.transformer_substations.delete_all
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      WaterIntakeUnit.create! row.to_hash
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |water_intake_unit|
        csv << water_intake_unit.attributes.values_at(*column_names)
      end
    end
  end

def self.search(params)
     result = WaterIntakeUnit
     if params['wiunum'].present?
       result = result.where(wiunum: params['wiunum'])
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

