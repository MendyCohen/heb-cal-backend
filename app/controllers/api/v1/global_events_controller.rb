class Api::V1::GlobalEventsController < ApplicationController

  def index
    @global_events = GlobalEvent.all
    render json: @global_events
  end

end
