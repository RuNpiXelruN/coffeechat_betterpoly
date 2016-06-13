module UserCreateHelper

  def create_user_profile(user)
    user = current_user
    @profile = Profile.new
    @profile.user = user
    @profile.save
  end
end
