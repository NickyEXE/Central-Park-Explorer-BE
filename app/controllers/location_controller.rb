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
    render json: @locations
  end

  def redirect
    @location = Location.find_location(params[:latitude].to_f, params[:longitude].to_f)
    if @location
      render json: {id: @location.id}
    else
      if params[:latitude]
        render json: {error: "You don't seem to be in Central Park!"}
      else
        render json: {error: "You need to enable your location to use this feature."}
      end
    end
  end
end
