class LocationTagSerializer < ActiveModel::Serializer
  attributes :id, :review, :location_id, :updated_at, :username, :tag


  def username
    User.find(self.object.user_id).username
  end

  def tag
    Tag.find(self.object.tag_id).tag
  end

end
