class EventsController < ApplicationController

  def index
    @events = Event.all
    render :calendar
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)

    if @event.save
      redirect_to event_path
    else
      render :new
      flash[:notice] = "Please fill in your %{attribute}"
    end
  end

  def edit
    @event = Event.find(params[:id])
  end


  def show
    @event = Event.find(params[:id])
  end

  private
  def event_params
    params.require(:event).permit(:title, :date, :location, :description)
  end
end