class LocationTagController < ApplicationController

  def show
    @location_tags = LocationTag.where(location_id: params[:locationid], tag_id: params[:tagid])
    render json: @location_tags
  end

  def destroy
    @location_tag = LocationTag.find(params[:locationid])
    if @location_tag.user_id === current_user.id
      @location_tag.destroy
      render json: current_user
    else
      render json: {errors: "Didn't work. Are you sure you're the correct user and not hitting this in a weird different way?"}
    end
  end





end
