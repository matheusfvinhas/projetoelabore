class EnrollmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_enrollment, only: %i[show destroy]

  def index
    @enrollments = current_user.enrollments.page(params[:page]).per(6)
  end

  def show
    @grade = params[:grade_id].nil? ? Grade.find(@enrollment.tracking.grade_id) : Grade.find(params[:grade_id])
    @grades = @enrollment.course.grades.order(:created_at)

    @enrollment.tracking.update(grade_id: @grade.id)
  end

  def create
    @course = Course.find(params[:course_id])
    @course.enrollments.create(user: current_user)

    if @course.save && create_tracking
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

    def create_tracking
      @tracking = Tracking.new
      @tracking.enrollment_id = Enrollment.all.where(course_id: @course.id, user_id: current_user.id).first.id
      @tracking.grade_id = @course.grades.first.id
      @tracking.save
    end

end
