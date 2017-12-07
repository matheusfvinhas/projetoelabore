class EventosController < ApplicationController
    before_action :set_evento, only: [:show, :edit, :update, :destroy]

    def new
        @evento = Evento.new
    end

    def index
        @eventos = Evento.all.order(data: :desc)
    end

    def show
        
    end

    def create                   
        @evento = Evento.new(evento_params)        

        if @evento.save
            flash[:notice] = "Evento salvo com sucesso."
            redirect_to eventos_path
        else
            flash[:alert] = "Erro ao salvar evento."
            render :new
        end
    end

    def edit
       
    end

    def update        
        if @evento.update(evento_params)
            flash[:notice] = "Evento atualizado com sucesso."
            redirect_to eventos_path
        else
            flash[:alert] = "Erro ao atualizar evento."
            render :edit
        end
    end

    def destroy
        if @evento.destroy
            flash[:notice] = "Evento deletado com sucesso."
        else
            flash[:alert] = "Erro ao deletar evento."
        end
        redirect_to eventos_path
    end

    private
        def set_evento            
            @evento = Evento.find(params[:id])
        end

        def evento_params
            params.require(:evento).permit(:title, :description, :local, :date, :time, {images: []}).merge(user_id: current_user.id)
        end

end

