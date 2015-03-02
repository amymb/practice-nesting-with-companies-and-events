class EventsController < ApplicationController
  before_action do
    @company = Company.find(params[:company_id])
  end

  def index
    @events = @company.events.all
  end

  def new
    @event = @company.events.new
  end

  def create
    @event = @company.events.new(event_params)
    if @event.save
      flash[:notice] = "Event successfully created!"
      redirect_to company_events_path(@company)
    else
     render new_company_event_path(@company)
   end
  end

  def show
    @event = @company.events.find(params[:id])
  end

  def edit
    @event = @company.events.find(params[:id])
  end

  def update
    @event = @company.events.find(params[:id])
    if @event.update
      flash[:notice] = "Event successfully updated!"
      redirect_to company_event_path(@company, @event)
    else
      render edit_company_event_path(@company, @event)
    end
  end

  def destroy
    @event = @company.events.find(params[:id])
    @event.destroy
    redirect_to company_events_path(@company)
  end

  def event_params
    params.require(:event).permit(:title)
  end

end
