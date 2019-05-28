class LocationSerializer < ActiveModel::Serializer
  attributes :name, :description, :id, :landmarks, :facts, :locimages, :tags, :center, :nearby_places


  def tags
    tags = LocationTag.where(location_id: self.object.id).map{|tag| tag.tag_id}.uniq
    Tag.where(id: tags)
  end

  def nearby_places
    center = self.object.center
    Location.nearest_places(center[:latitude], center[:longitude])
  end

end
