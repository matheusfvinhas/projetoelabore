class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def ask_question
    @enrollment = Enrollment.find(params[:enrollment_id])
    @grade = Grade.find(params[:grade_id])
  end

  def send_question
    redirect_to enrollment_path(params[:enrollment_id])
  end
end
