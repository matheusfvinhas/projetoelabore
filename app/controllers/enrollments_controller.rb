class EnrollmentsController < ApplicationController

  def index    
    @enrollments = current_user.enrollments.page(params[:page]).per(6)
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
    @enrollment = Enrollment.find(params[:id])

    if @enrollment.destroy
      flash[:notice] = 'Desmatriculado com sucesso.'
    else
      flash[:alert] = 'Erro ao desmatricular curso.'
    end
    redirect_to enrollments_path
  end
end
