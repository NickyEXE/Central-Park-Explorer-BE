class LocationSerializer < ActiveModel::Serializer
  attributes :name, :description, :id, :landmarks, :facts, :locimages, :tags


  def tags
    tags = LocationTag.where(location_id: 1).map{|tag| tag.tag_id}.uniq
    Tag.where(id: tags)
  end

end
