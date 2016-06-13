class ProfilesController < ApplicationController

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
  end

  def update
    if @profile = current_user.profile
      @profile.update(profile_params)
      redirect_to profile_path(current_user)
    end
  end


  private
  def profile_params
    params.require(:profile).permit(:bio, :user_id)
  end
end
