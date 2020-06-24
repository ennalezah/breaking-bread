class Business < ApplicationRecord
  # require 'csv'
  # require 'active_record'
  # require 'activerecord-import/base'
  # require 'activerecord-import/active_record/adapters/sqlite3_adapter'

  belongs_to :neighborhood
  validates :name, presence: true

  # validates :phone, 
  #   length: { is: 10, wrong_length: "Must contain %{count} digits" },
  #   format: { with: /\A[0-9]+\z/, message: "Only allows numbers" }

  before_save :titleize_name, :format_phone
  

  # def self.import_from_csv   
  #   businesses = []
    
  #   CSV.foreach('lib/la_businesses_seeds.csv', headers: true) do |row|
  #     # neighborhood_id = neighborhoods[row[:neighborhood]]
    
  #     business = { name: row[:restaurant],phone: row[:phone], website: row[:website], instagram: row[:ig], neighborhood: neighborhood }
    
  #     businesses << business
  #   end
  #   Business.import businesses, validate: false
  # end

  private

  def titleize_name
    self.name = self.name.try(:titleize)
  end

  def format_phone
    p = self.phone.scan(/\d/)
    areaCode = p[0..2].join
    prefix = p[3..5].join
    lineNumber = p[6..9].join
    self.phone = "(#{areaCode}) #{prefix}-#{lineNumber}"    
  end
end
