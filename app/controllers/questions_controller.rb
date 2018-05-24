# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_enrollment

  def ask_question
    @grade = Grade.find(params[:grade_id])
  end

  def send_question
    QuestionsMailer.send_question(params[:grade_title],
                                  params[:email_teacher],
                                  params[:email_student],
                                  @enrollment.user.name,
                                  params[:question],
                                  @enrollment.course.title).deliver_later
    flash[:notice] = "Pergunta enviada com sucesso."
    redirect_to enrollment_path(@enrollment)
  end

  private
    def set_enrollment
      @enrollment = Enrollment.find(params[:enrollment_id])
    end
end
