class TicketsController < ApplicationController
  before_action :set_event, only: [:new, :create]

  def new
    if @event.active?
      @ticket = @event.tickets.new
    else
      redirect_to events_path, alert: "This event is not active for registrations."
    end
  end

  def create
    if @event.active?
      @ticket = @event.tickets.new(ticket_params)
      available_tickets = @event.max_allocation - @event.tickets.count

      if available_tickets > 0
        if @ticket.save
          ConfirmTicketJob.perform_later(@ticket.id) #enqueue job
          redirect_to root_path, alert: 'Ticket registered successfully!'
        else
          render :new
        end
      else
        redirect_to root_path, alert: 'No More tickets available for this event!'
      end
    else
      redirect_to events_path, alert: 'This event is not active for registration.'
    end
  end

  private
  def set_event
    @event = Event.find(params[:event_id])
  end

  def ticket_params
    params.require(:ticket).permit(:name, :email, :status, :event_id)
  end
end
