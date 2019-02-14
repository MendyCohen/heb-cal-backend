class Api::V1::EventsController < ApplicationController

  def index
    @events = Event.all
    render json: @events
  end

  # def show
  #       @event = Event.find(params[:id])
  #   end

    def show
      days = params[:id].split(', ')
      @event = Event.where("date_part('day', day) = ? AND date_part('month', day) = ? AND date_part('year', day) = ?", *days)
      render json: @event
    end

  def create
    @event = Event.create(event_params)
    render json: @event
  end

  def update
    @event = Event.find(params[:id])
      render json: @event
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    render json: @event
  end

  private
  def event_params
    params.require(:event).permit(:title, :note, :hour, :day, :user_id)
  end

end
