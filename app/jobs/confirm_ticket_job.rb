class ConfirmTicketJob < ApplicationJob
  queue_as :default

  def perform(ticket_id)
    ticket = Ticket.find(ticket_id)
    # Simulate confirmation process
    puts "start processing for ticket id: #{ticket_id}"
    ticket.update(status: "confirmed")
    puts "Ticket id: #{ticket_id} done processing..."
    puts ''
  end
end
