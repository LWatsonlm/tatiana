class EventsController < ApplicationController

def index
  @events = Event.all

  render json: @events
end

def show
  @event = Event.find(params[:id])
  @attendees = @event.users
  data = {
    event: @event,
    attendees: @attendees
  }

  render json: data
end

def new
  @event = Event.new
end

def create
  @event = Event.create!(event_params)
  render json: @event

end

def edit
  @event = Event.find(params[:id])
end

def update
  @event = Event.find(params[:id])
  @attendees = @event.users
  @event.update!(event_params)
  data = {
    event: @event,
    attendees: @attendees
  }
  puts data

  render json: data
end

def destroy
  @event = Event.find(params[:id])
  @event.destroy

  redirect_to events_path
end

private
def event_params
  params.require(:event).permit(:title, :code, :location, :time, :cost, :date)
end

end
