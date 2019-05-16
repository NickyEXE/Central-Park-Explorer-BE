class LocationSerializer < ActiveModel::Serializer
  attributes :name, :description, :id, :landmarks, :facts, :locimages, :tags


end
