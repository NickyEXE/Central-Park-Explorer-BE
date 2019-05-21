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

end
