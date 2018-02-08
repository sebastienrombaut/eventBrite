class EventsController < ApplicationController
  def new
  	@event = Event.new
  end
  
  def create
  	@event = Event.new(event_params)
  	#debugger
  	@event.creator_id = current_user.id

  	if @event.save
  		redirect_to @event
  	else
  		render 'new'
  	end

  end

  def show
  	@event = Event.find(params[:id])
  end

  def index
  	@events = Event.all
  end

  private 

  def event_params
  	params.require(:event).permit(:description, :date, :place)
  end
end
