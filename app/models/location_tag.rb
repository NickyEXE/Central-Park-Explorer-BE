class LocationTag < ApplicationRecord
  belongs_to :location
  belongs_to :tag
  belongs_to :user
end
