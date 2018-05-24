# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_teachers, only: %i[new create edit]
  before_action :set_course, only: %i[edit update destroy]

  def new
    @course = Course.new
  end

  def index
    if current_user.admin?
      @courses = Course.all.order(title: :asc).page(params[:page]).per(6)
    elsif current_user.teacher?
      @courses = Course.all.where(user_id: current_user.id).page(params[:page]).per(6)
    elsif current_user.student?
      @courses = Course.all.where.not(id: current_user.enrollments.map(&:course_id)).page(params[:page]).per(6)
    end
  end

  def show; end

  def create
    @course = Course.new(course_params)

    if @course.save
      flash[:notice] = "Curso salvo com sucesso."
      redirect_to courses_path
    else
      flash[:alert] = "Erro ao salvar curso."
      render :new
    end
  end

  def edit; end

  def update
    if @course.update(course_params)
      flash[:notice] = "Curso atualizado com sucesso."
      redirect_to courses_path
    else
      flash[:alert] = "Erro ao atualizar curso."
      render :edit
    end
  end

  def destroy
    if @course.destroy
      flash[:notice] = "Curso deletado com sucesso."
    else
      flash[:alert] = "Erro ao deletar curso."
    end
    redirect_to courses_path
  end

  private
    def course_params
      params.require(:course).permit(:title, :description, :document, :user_id)
    end

    def set_course
      @course = Course.find(params[:id])
    end

    def set_teachers
      @teachers = User.all.where(kind: :teacher)
    end
end
