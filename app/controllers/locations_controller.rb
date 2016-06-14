class LocationsController < ApplicationController

  def create
    @location = @locationable.locations.new(location_params)
    @location.user_id = current_user.id
    @location.save
    redirect_to @locationable, notice: "Successfully added location"
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @user = current_user
    @profile = @user.profile
    @location = Location.find(params[:id])
    @location.update(location_params)
    if @location.save
      redirect_to @profile, notice: "Successfully Updated!!"
    end
  end

  def destroy
    @location = Location.find(params[:id])
    if @location.destroy
      redirect_to :back, notice: "Deleted!!"
    end
  end

  private
  def location_params
    params.require(:location).permit(:suburb)
  end
end
