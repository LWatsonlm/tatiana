class EventsController < ApplicationController

def index
  @events = Event.all

  respond_to do |format|
    format.html {render :events}
    format.json {render json: @events}
  end
end

def show
  @event = Event.find(params[:id])
end

def new
  @event = Event.new
end

def create
  @event = Event.create(event_params)

  redirect_to event_path(@event)
end

def edit
  @event = Event.find(params[:id])
end

def update
  @event = Event.find(params[:id])
  @event.update(event_params)

  redirect_to event_path(@event)
end

def destroy
  @event = Event.find(params[:id])
  @event.destroy

  redirect_to events_path
end

# strong params
private
def event_params
  params.require(:event).permit(:title, :code, :location, :time, :cost, :date)
end

end