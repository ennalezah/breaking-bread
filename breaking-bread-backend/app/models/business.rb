class Business < ApplicationRecord
  belongs_to :neighborhood

  validates :name, presence: true
  before_validation :titleize_name

  private

  def titleize_name
    self.name = name.titleize
  end
end
