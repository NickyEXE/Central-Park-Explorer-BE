class RecommendedPlacesSerializer < ActiveModel::Serializer
  attributes :name, :description, :image, :alt, :id, :interests

  def name
    self.object.name
  end

  def description
    self.object.description
  end

  def image
    self.object.locimages.first.url
  end

  def alt
    self.object.locimages.first.alt
  end

  def interests
    self.object.matching_user_interests(@instance_options[:user])
  end

end
