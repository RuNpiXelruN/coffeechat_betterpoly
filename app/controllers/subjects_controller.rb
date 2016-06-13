class SubjectsController < ApplicationController

  def all_subjects
    @all_subjects = Subject.all.order(created_at: :desc)
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
