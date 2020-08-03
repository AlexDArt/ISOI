class BoilerHouse < ActiveRecord::Base
  has_and_belongs_to_many :transformer_substations
  belongs_to :water_intake_unit
  has_many :houses
  has_many :social_objects
  has_many :shopping_centers

  validates :bhname, presence: true, uniqueness: true
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
      BoilerHouse.create! row.to_hash
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |boiler_house|
        csv << boiler_house.attributes.values_at(*column_names)
      end
    end
  end

def self.search(params)
     result = BoilerHouse
     if params['address'].present?
       result = result.where(address: params['address'])
     end
     if params['bhname'].present?
       result = result.where(bhname: params['bhname'])
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
