class TagController < ApplicationController

  # renders all tags for a location, and tells user if they've reviewed them before
  def show
    @tags = Tag.all
    render json: @tags, location_id: params[:id]
  end

  def create
    @locationtag = LocationTag.find_or_create_by(location_id: params[:id], user_id: current_user.id, tag_id: params[:tag_id])
    if @locationtag
      @locationtag.update(review: params[:review])
      @location = Location.find(params[:id])
      render json: @location
    else
      render json: {errors: "Invalid!"}
    end
  end
end
