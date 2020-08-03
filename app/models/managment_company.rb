class ManagmentCompany < ActiveRecord::Base
  has_many :houses

  validates :mcname, presence: true, uniqueness: true
  validates :director, presence: true
  validates :phones_of_operators, presence: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      ManagmentCompany.create! row.to_hash
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |managment_company|
        csv << managment_company.attributes.values_at(*column_names)
      end
    end
  end

def self.search(params)
     result = ManagmentCompany
     if params['mcname'].present?
       result = result.where(mcname: params['mcname'])
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
