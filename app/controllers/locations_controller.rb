class LocationsController < ApplicationController

  def create
    @location = @locationable.locations.new(location_params)
    @location.user_id = current_user.id
    @location.save
    redirect_to @locationable, notice: "Successfully added location"
  end


  private
  def location_params
    params.require(:location).permit(:suburb)
  end
end
