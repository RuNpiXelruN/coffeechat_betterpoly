class Profiles::SubjectsController < SubjectsController
  before_action :set_subjectable


  def show
    @profile = Profile.find(params[:id])
    @user = @profile.user
    @subject = @user.profile.subject
  end

  private
  def set_subjectable
    @subjectable = Profile.find(params[:profile_id])
  end
end
