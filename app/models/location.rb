class Location < ApplicationRecord
  has_many :landmarks
  has_many :facts
  has_many :location_tags
  has_many :tags, :through => :location_tags
  has_many :locimages

  def create_reference_to_tag_by_name(tag)
    LocationTag.create(location_id: self.id, tag_id: Tag.find_by(tag: tag).id)
  end

end
