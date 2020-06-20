class Neighborhood < ApplicationRecord
  belongs_to :city
  has_many :businesses, dependent: :destroy
end
