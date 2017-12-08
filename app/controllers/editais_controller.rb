class EditaisController < ApplicationController
    before_action :set_notice, only: [:show, :edit, :update, :destroy]

    def new
        @notice = Edital.new
    end

    def index
        @notices = Edital.all.order(created_at: :desc)
    end

    def show
        
    end

    def create
        @notice = Edital.new(notice_params)        

        if @notice.save
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
        if @notice.update(notice_params)
            flash[:notice] = "Edital atualizado com sucesso."
            redirect_to editais_path
        else
            flash[:alert] = "Erro ao atualizar edital."
            render :edit
        end
    end

    def destroy
        if @notice.destroy
            flash[:notice] = "Edital deletado com sucesso."
        else
            flash[:alert] = "Erro ao deletar edital."
        end
        redirect_to editais_path
    end

    private
        def set_notice
            @notice = Edital.find(params[:id])
        end

        def notice_params
            params.require(:edital).permit(:title, :description, :document).merge(user_id: current_user.id)
        end
end
