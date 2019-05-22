class LocationTagController < ApplicationController

  def show
    @location_tags = LocationTag.where(location_id: params[:locationid], tag_id: params[:tagid])
    render json: @location_tags
  end


end
