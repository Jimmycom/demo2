class EventsController < ApplicationController
  before_filter :authenticate_user! 
  
  def index
    @events = Event.all
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    @event.save
    
    redirect_to events_url
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    @event.update_attributes(event_params)
    
    redirect_to events_url
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    
    redirect_to events_url
  end
  
  private
  def event_params
    params.require(:event).permit(:name)
  end
end
