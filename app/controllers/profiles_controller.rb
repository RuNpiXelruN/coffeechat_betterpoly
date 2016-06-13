class ProfilesController < ApplicationController

  def show
    @profile = Profile.find(params[:id])
    @user = @profile.user
  end

  def update
    if @profile = current_user.profile
      @profile.update(profile_params)
      redirect_to profile_path(current_user.profile)
    end
  end


  private
  def profile_params
    params.require(:profile).permit(:bio, :user_id)
  end
end
