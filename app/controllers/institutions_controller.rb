# frozen_string_literal: true

class InstitutionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_institution, only: %i[show destroy]

  def new
    @institution = Institution.new
  end

  def create
    @institution = Institution.new(institution_params)

    if @institution.save
      flash[:notice] = "Instituição salvo com sucesso."
      redirect_to institutions_path
    else
      flash[:alert] = "Erro ao salvar Instituição."
      render :new
    end
  end

  def show
  end

  def index
    @institutions = Institution.all.order(:name).page(params[:page]).per(10)
  end

  def destroy
    if @institution.destroy
      flash[:notice] = "Instituição deletada com sucesso."
    else
      flash[:alert] = "Erro ao tentar remover instituição."
    end

    redirect_to institutions_path
  end

  private

    def institution_params
      params.require(:institution).permit(:name, :manager)
    end

    def set_institution
      @institution = Institution.find(params[:id])
    end
end
