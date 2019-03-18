class Api::V1::GlobalEventsController < ApplicationController

  def index
    @global_events = GlobalEvent.all
    render json: @global_events
  end

  # def show
  #     @global_events = Event.find(params[:id])
  #   end

    def show
      days = params[:id].split(', ')
      @global_events = GlobalEvent.where("date_part('day', day) = ? AND date_part('month', day) = ? AND date_part('year', day) = ?", *days)
      render json: @global_events
    end

  def create
    @global_events = GlobalEvent.create(event_params)
    render json: @global_events
  end

  def update
    @global_events = GlobalEvent.find(params[:id])
     @global_events.update(event_params)
      render json: @global_events
  end

  def destroy
    @global_events = GlobalEvent.find(params[:id])
    @global_events.destroy
    render json: @global_events
  end

  private
  def event_params
    params.require(:global_events).permit(:title, :note, :hour, :day, :user_id)
  end

end
