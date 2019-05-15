class Tag < ApplicationRecord
  has_many :locations, through: :location_tags
  belongs_to :interest
end
