class EventosController < ApplicationController
    before_action :set_event, only: [:show, :edit, :update, :destroy]

    def new
        @event = Evento.new
    end

    def index
        @events = Evento.all.order(date: :desc)
    end

    def show
        
    end

    def create                   
        @event = Evento.new(event_params)        

        if @event.save
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
        if @event.update(event_params)
            flash[:notice] = "Evento atualizado com sucesso."
            redirect_to eventos_path
        else
            flash[:alert] = "Erro ao atualizar evento."
            render :edit
        end
    end

    def destroy
        if @event.destroy
            flash[:notice] = "Evento deletado com sucesso."
        else
            flash[:alert] = "Erro ao deletar evento."
        end
        redirect_to eventos_path
    end

    private
        def set_event           
            @event = Evento.find(params[:id])
        end

        def event_params
            params.require(:evento).permit(:title, :description, :local, :date, :time, {images: []}).merge(user_id: current_user.id)
        end

end

