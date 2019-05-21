class TagSerializer < ActiveModel::Serializer
  attributes :id, :tag, :current_reviews, :user_review

  def current_reviews
    LocationTag.where(location_id: @instance_options[:location_id], tag_id: self.object.id)
  end

  def user_review
    review = current_reviews.find_by(user_id: @instance_options[:scope][:id])
    if review
      review.review
    else
      ""
    end
  end

end
