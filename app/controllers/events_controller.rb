# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_event, only: %i[show edit update destroy destroy_image]

  def new
    @event = Event.new
  end

  def index
    @events = Event.all.order(date: :desc, time: :desc).page(params[:page]).per(6)
  end

  def show; end

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
    format_date_time
  end

  def update
    if update_event
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

  def destroy_image
    remove_image_at_index(params[:format].to_i)
    if @event.save
      flash[:notice] = "Imagem deletada com sucesso."
    else
      flash[:alert] = "Erro ao deletar imagem."
    end
    redirect_to event_path(@event)
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :description, :local, :date, :time, images: []).merge(user_id: current_user.id)
    end

    def format_date_time
      @event.date = I18n.l(@event.date)
      @event.time = @event.time.to_s(:event_time)
    end

    def update_event
      add_more_images(event_params[:images]) unless event_params[:images].nil?
      @event.title = event_params[:title]
      @event.description = event_params[:description]
      @event.local = event_params[:local]
      @event.date = event_params[:date]
      @event.time = event_params[:time]
      @event.user_id = current_user.id
      @event.save
    end

    def add_more_images(new_images)
      images = @event.images
      images += new_images
      @event.images = images
    end

    def remove_image_at_index(index)
      remain_images = @event.images
      remain_images.delete_at(index)
      if remain_images.empty?
        @event.remove_images!
      else
        @event.images = remain_images
      end
    end
end
