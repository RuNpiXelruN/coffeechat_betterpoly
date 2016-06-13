module UserCreateHelper

  def create_user_profile(user)
    user = current_user
    @profile = Profile.new
    @profile.user_id = current_user.id
    @profile.save
  end
end
