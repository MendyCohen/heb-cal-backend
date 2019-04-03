class Api::V1::EventsController < ApplicationController

  before_action :authenticate_request!, only: [:index, :show, :create, :update]

  def index
    @events = Event.all
    render json: @events
  end

  # def show
  #     @event = Event.find(params[:id])
  #   end

    def show
      days = params[:id].split(', ')
       # @event = Event.where("date_part('day', day) = ? AND date_part('month', day) = ? AND date_part('year', day) = ? AND user_id = ?", days[0], days[1], days[2], @current_user.id)
       @event = Event.where("date_part('day', day) = ? AND date_part('month', day) = ? AND date_part('year', day) = ? AND user_id = ?", *days, @current_user.id)
      render json: @event
    end

  def create
    @event = Event.create(event_params.merge('user_id' => @current_user.id))
    render json: @event
  end

  def update
    @event = Event.find(params[:id])
     @event.update(event_params)
      render json: @event
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    render json: @event
  end

  private
  def event_params
    params.require(:event).permit(:title, :note, :hour, :day)
  end

end
