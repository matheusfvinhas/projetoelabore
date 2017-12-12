class EventsController < ApplicationController
    before_action :set_event, only: [:show, :edit, :update, :destroy]

    def new
        @event = Event.new
    end

    def index
        @events = Event.all.order(date: :desc)
    end

    def show
        
    end

    def create                   
        @event = Event.new(event_params)        

        if @event.save
            flash[:notice] = "Evento salvo com sucesso."
            redirect_to events_path
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
            redirect_to events_path
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
        redirect_to events_path
    end

    private
        def set_event           
            @event = Event.find(params[:id])
        end

        def event_params
            params.require(:event).permit(:title, :description, :local, :date, :time, {images: []}).merge(user_id: current_user.id)
        end

end

