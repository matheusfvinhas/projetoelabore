# frozen_string_literal: true

class GradesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_grade, only: %i[show edit update destroy]
  before_action :set_course, only: %i[new create]

  def new
    @grade = @course.grades.build
  end

  def show; end

  def create
    @grade = @course.grades.create(grades_params)

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
        redirect_to grade_path(@grade)
    else
      flash[:alert] = 'Erro ao atualizar curso.'
        render :edit
    end
  end

  def destroy
    @course = @grade.course

    if @grade.destroy
      flash[:notice] = 'Curso deletado com sucesso.'
    else
      flash[:alert] = 'Erro ao deletar curso.'
    end
    redirect_to course_grades_path(@course)
  end

  private
    def grade_params
      params.require(:grade).permit(:title, :description, :video_lonk, :document)
    end

    def set_grade
      @grade = Grade.find(params[:id])
    end

    def set_course
      @course = Course.find(params[:course_id])
    end

end
