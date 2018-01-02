class NoticesController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    before_action :set_notice, only: [:show, :edit, :update, :destroy]

    def new
        @notice = Notice.new
    end

    def index
        @notices = Notice.all.order(created_at: :desc).page(params[:page]).per(6)
    end

    def show
        
    end

    def create
        @notice = Notice.new(notice_params)        

        if @notice.save
            flash[:notice] = "Edital salvo com sucesso."
            redirect_to notices_path
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
            redirect_to notices_path
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
        redirect_to notices_path
    end

    private

        def set_notice
            @notice = Notice.find(params[:id])
        end

        def notice_params
            params.require(:notice).permit(:title, :description, :document).merge(user_id: current_user.id)
        end
end
