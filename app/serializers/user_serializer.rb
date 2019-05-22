class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :interests, :reviews

  def interests
    Userinterest.where(user_id: self.object.id).map{|ui| Interest.find(ui.interest_id)}
  end

  def reviews
    LocationTag.where(user_id: self.object.id).map{|lt| {id: lt.id, location: Location.find(lt.location_id), tag: Tag.find(lt.tag_id), review: lt.review, time: (lt.created_at.to_f*1000)}}
  end

end
