class Location < ApplicationRecord
  has_many :landmarks
  has_many :facts
  has_many :tags
  has_many :locimages
end
