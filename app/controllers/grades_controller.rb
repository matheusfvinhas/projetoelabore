class GradesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_grade, only: %i[show edit update destroy]
  before_action :set_course, only: %i[new create index]
  before_action :find_course, only: %i[edit update destroy]
  before_action :config_link, only: %i[create update]

  def new
    @grade = @course.grades.build
  end

  def index
    @grades = @course.grades.order(created_at: :asc).page(params[:page]).per(10)
  end

  def create
    @grade = @course.grades.create(grade_params)

    if @grade.save
      flash[:notice] = 'Aula salva com sucesso.'
      redirect_to course_grades_path(@course)
    else
      flash[:alert] = 'Erro ao salvar aula.'
      render :new
    end
  end

  def edit; end

  def update
    if @grade.update(grade_params)
      flash[:notice] = 'Curso atualizado com sucesso.'
        redirect_to course_grades_path(@course)
    else
      flash[:alert] = 'Erro ao atualizar curso.'
        render :edit
    end
  end

  def destroy
    if @grade.destroy
      flash[:notice] = 'Curso deletado com sucesso.'
    else
      flash[:alert] = 'Erro ao deletar curso.'
    end
    redirect_to course_grades_path(@course)
  end

  private
    def grade_params
      params.require(:grade).permit(:title, :description, :video_link, :document)
    end

    def set_grade
      @grade = Grade.find(params[:id])
    end

    def set_course
      @course = Course.find(params[:course_id])
    end

    def find_course
      @course = @grade.course
    end

    def config_link
      if !params[:grade][:video_link].start_with?('http') && !params[:grade][:video_link].blank?
        params[:grade][:video_link] = 'http://#{params[:grade][:video_link]}'
      end
      params[:grade][:video_link].sub! 'watch?v=', 'embed/'
    end
end
