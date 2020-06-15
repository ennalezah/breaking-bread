class Business < ApplicationRecord

  belongs_to :neighborhood

  validates :name, presence: true

  # validates :phone, 
  #   length: { is: 10, wrong_length: "Must contain %{count} digits" },
  #   format: { with: /\A[0-9]+\z/, message: "Only allows numbers" }

  before_validation :titleize_name, :format_phone

  private

  def titleize_name
    self.name = name.titleize
  end

  def format_phone
    p = phone.scan(/\d/)
    areaCode = p[0..2].join
    prefix = p[3..5].join
    lineNumber = p[6..9].join
    self.phone = "(#{areaCode}) #{prefix}-#{lineNumber}"    
  end
end
