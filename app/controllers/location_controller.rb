class LocationController < ApplicationController

  def show
    @location = Location.find(params[:id])
    if @location
      render json: @location
    else
      render json: {error: "Not a place fam."}
    end
  end

  def index
    @locations = Location.all
    render json: @locations, each_serializer: RecommendedPlacesSerializer, user: current_user
  end

  def redirect
    @location_object = Location.nearest_places(params[:latitude].to_f, params[:longitude].to_f)
    if @location_object
      render json: @location_object
    else
      render json: {error: "We were unable to use your latitude and longitude. It's likely that you need to enable your location to use this feature."}
    end
  end


  def recommend_based_on_interests
    locations = Location.sort_by_matching_user_interests(current_user)
    render json: locations, each_serializer: RecommendedPlacesSerializer, user: current_user
  end

  #   @location = Location.find_location(params[:latitude].to_f, params[:longitude].to_f)
  #   if @location
  #     render json: {id: @location.id}
  #   else
  #     if params[:latitude]
  #       render json: {error: "You don't seem to be in Central Park!"}
  #     else
  #       render json: {error: "You need to enable your location to use this feature."}
  #     end
  #   end
  # end
end
