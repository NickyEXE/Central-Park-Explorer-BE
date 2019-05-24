class Location < ApplicationRecord
  has_many :landmarks
  has_many :facts
  has_many :location_tags
  has_many :tags, :through => :location_tags
  has_many :locimages


  # scope :find_by_lonlat, -> (longitude, latitude) {
  #   where(%{
  #     ST_Within(ST_SetSRID(ST_MakePoint(%f, %f),4326), geom)
  #   } % [longitude, latitude])
  # }

  def create_reference_to_tag_by_name_user_id_and_review(tag, id, review)
    LocationTag.create(location_id: self.id, tag_id: Tag.find_by(tag: tag).id, user_id: id, review: review)
  end

  def self.find_location(lat, long)
    factory = RGeo::Cartesian.factory
    matching_locations = self.all.select{|location| location.geom.contains?(factory.point(long,lat))}
    matching_locations[0]
  end

end
