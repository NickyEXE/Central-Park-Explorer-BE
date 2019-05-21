class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  has_many :userinterests
  has_many :interests, through: :userinterests
  has_many :location_tags
  has_many :tags, through: :location_tags


  def create_interest_by_id(id)
    Userinterest.create(user_id: self.id, interest_id: id)
  end

  def create_list_of_interests_by_ids(id_array)
    id_array.each do |id|
      self.create_interest_by_id(id)
    end
  end

end
