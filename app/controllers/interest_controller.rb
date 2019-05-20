class InterestController < ApplicationController

  def share_all_interests
    @interests = Interest.all
    render json: @interests, user_id: current_user.id
  end

  def add_interests_to_user
    current_user.create_list_of_interests_by_ids(params[:interest_ids])
    token = encode_token({user_id: current_user.id})
    render json: {user: current_user, jwt: token }
  end

end
