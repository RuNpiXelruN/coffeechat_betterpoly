class Profiles::SubjectsController < SubjectsController
  before_action :set_subjectable

  private
  def set_subjectable
    @subjectable = Profile.find(params[:profile_id])
  end
end
