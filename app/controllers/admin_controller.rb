class AdminController < ApplicationController
  ## 
  # Apenas uma view para redirecionar a lista de Requisições
  def panel
    @bookings = Booking.all
    @tickets = Ticket.all
  end

  def index
  end
end
