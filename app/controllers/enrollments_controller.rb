class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: %i[show destroy]

  def index
    @enrollments = current_user.enrollments.page(params[:page]).per(6)
  end

  def show
    @grade = params[:grade_id].nil? ? @enrollment.course.grades.first : Grade.find(params[:grade_id])
    @grades = @enrollment.course.grades.order(:created_at)
  end

  def create
    @course = Course.find(params[:course_id])
    @course.enrollments.create(user: current_user)

    if @course.save
      flash[:notice] = 'Matrícula Efetuada com sucesso.'
    else
      flash[:alert] = 'Erro ao efetuar matrícula.'
    end

    redirect_to enrollments_path
  end

  def destroy
    if @enrollment.destroy
      flash[:notice] = 'Desmatriculado com sucesso.'
    else
      flash[:alert] = 'Erro ao desmatricular curso.'
    end
    redirect_to enrollments_path
  end

  private
    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end

end
