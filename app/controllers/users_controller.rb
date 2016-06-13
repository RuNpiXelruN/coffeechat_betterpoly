class UsersController < ApplicationController
  include UserCreateHelper

  skip_before_action :require_login, only: [:new, :create], raise: false

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
  end

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      create_user_profile(current_user)
      redirect_to profile_path(current_user.profile)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
