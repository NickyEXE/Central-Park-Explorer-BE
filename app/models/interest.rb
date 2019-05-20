class Interest < ApplicationRecord
  has_many :tags
  has_many :userinterests
  has_many :users, through: :userinterests

  def checked(id)
    user = User.find_by(id: id)
    if user
      return (User.find_by(id: id).userinterests.select{|userinterest| userinterest.interest_id ===self.id}.length>0)
    else
      return false
    end
  end
end
