class EditaisController < ApplicationController
    before_action :set_edital, only[:show, :edit, :update, :destroy]

    def new
        @edital = Edital.new
    end

    def index
        @editais = Edital.all
    end

    def show

    end

    def create
        @edital = Edital.new(edital_params)
        @edital.usuario_id = current_user.id

        if @edital.save
            flash[:notice] = "Edital salvo com sucesso."
            redirect_to editais_path
        else
            flash[:alert] = "Erro ao salvar edital."
            render :new
        end
    end

    def edit

    end

    def update
        if @edital.update(edital_params)
            flash[:notice] = "Edital atualizado com sucesso."
            redirect_to edital_path(@edital)
        else
            flash[:alert] = "Erro ao atualizar edital."
            render :edit
        end
    end

    def destroy
        if @edital.destroy
            flash[:notice] = "Edital deletado com sucesso."
        else
            flash[:alert] = "Erro ao deletar edital."
        end
        redirect_to editais_path
    end

    private
        def set_edital
            @edital = Edital.find(params[:id])
        end

        def edital_params
            params.require(:edital).permit(:titulo, :descricao)
        end
end
