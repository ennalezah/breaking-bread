class City < ApplicationRecord
  has_many :neighborhoods, dependent: :destroy
end
