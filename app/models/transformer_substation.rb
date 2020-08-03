class TransformerSubstation < ActiveRecord::Base
  has_and_belongs_to_many :boiler_houses
  has_and_belongs_to_many :water_intake_units
  has_many :houses
  has_many :social_objects
  has_many :shopping_centers

  validates :tsnum, presence: true, uniqueness: true
  validates :phones_of_operators, presence: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode

  accepts_nested_attributes_for :boiler_houses
  accepts_nested_attributes_for :water_intake_units
  before_save do
    self.boiler_houses.delete_all
    self.water_intake_units.delete_all
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      TransformerSubstation.create! row.to_hash
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |transformer_substation|
        csv << transformer_substation.attributes.values_at(*column_names)
      end
    end
  end

def self.search(params)
     result = TransformerSubstation
     if params['tsnum'].present?
       result = result.where(tsnum: params['tsnum'])
     end
     if params['address'].present?
       result = result.where(address: params['address'])
     end
     if params['phones_of_operators'].present?
       result = result.where(phones_of_operators: params['phones_of_operators'])
     end
     if params['power_supply_center'].present?
       result = result.where(power_supply_center: params['power_supply_center'])
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
