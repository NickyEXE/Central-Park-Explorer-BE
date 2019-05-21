class Tag < ApplicationRecord
  has_many :location_tags
  has_many :locations, through: :location_tags
  has_many :users, through: :location_tags
  belongs_to :interest

end
