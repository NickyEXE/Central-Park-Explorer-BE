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

  def self.nearest_places(lat, long)
    factory = RGeo::Cartesian.factory
    point = factory.point(long,lat)
    nearest_places_array = self.all.sort_by{|location| location.geom.distance(point)}
    if nearest_places_array[0].geom.contains?(point)
      {current_location: nearest_places_array[0], nearest_places: nearest_places_array.slice(1,5)}
    else
      {nearest_places: self.all.sort_by{|location| location.geom.distance(factory.point(long, lat))}.slice(0,4)}
    end
  end

  def self.find_location(lat, long)
    factory = RGeo::Cartesian.factory
    matching_locations = self.all.select{|location| location.geom.contains?(factory.point(long,lat))}
    matching_locations[0]
  end

  def center
    {latitude: self.geom.centroid.y, longitude: self.geom.centroid.x}
  end

end
