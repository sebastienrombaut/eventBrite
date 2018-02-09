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

  def suscribe
    @event = Event.find(params[:id])
    @event.attendees << current_user
    flash[:success] = "Tu es bien ajouté à l'évent :)"
    redirect_to @event
  end

  def invite
   
    @event = Event.find(params[:id])
    @user = User.find(params[:user])
    @event.attendees << @user
    flash[:success] = "Tu as bien ajouté ton pote à l'évent :)"
    redirect_to @event
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
