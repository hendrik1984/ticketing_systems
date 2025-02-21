class TicketsController < ApplicationController
  def new
    @ticket = Ticket.new
  end

  def create
    available_tickets = $redis.get('available_tickets').to_i

    if available_tickets > 0
      @ticket = Ticket.new(ticket_params)
      
      if @ticket.save
        $redis.decr('available_tickets')
        ConfirmTicketJob.perform_later(@ticket.id) #enqueue job
        redirect_to root_path, notice: 'Ticket registered successfully!'
      else
        render :new
      end
    else
      redirect_to root_path, alert: 'No More tickets available!'
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:name, :email, :status)
  end
end
