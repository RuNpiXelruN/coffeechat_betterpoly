class SubjectsController < ApplicationController

  def index
    @subjects = Subject.all.order(created_at: :desc)
  end

  def show
    @subject = Subject.find(params[:id])
    @user = @subject.user
    @profile = @user.profile
  end

  def create
    @subject = @subjectable.subjects.new(subject_params)
    @subject.user = current_user
    @subject.save
    redirect_to @subjectable, notice: "Successfully added subject"
  end

  private
  def subject_params
    params.require(:subject).permit(:title, :description)
  end
end
