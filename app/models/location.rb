class Location < ApplicationRecord
  has_many :landmarks
  has_many :facts
  has_many :location_tags
  has_many :tags, :through => :location_tags
  has_many :locimages

  def create_reference_to_tag_by_name_user_id_and_review(tag, id, review)
    LocationTag.create(location_id: self.id, tag_id: Tag.find_by(tag: tag).id, user_id: id, review: review)
  end

end
