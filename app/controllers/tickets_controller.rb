class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  ##
  # Serve para buscar todas as requisitos e envia as informações para a view
  # @return [@requirements] se existir
  def index
    @tickets = Ticket.all
  end

 
  ##
  # Metodo serve apenas para view
  def show
  end

  ##
  # Metodo serve apenas para view
  def new
    @ticket = Ticket.new
  end

  ##
  # Metodo serve apenas para view
  def edit
  end

  ##
  # Metodo cria ticket
  # @param [Date] data_entrada
  # @param [Date] data_saida
  # Criação bem sucedida:
  #   @return { render :show, status: :created, location: @ticket }
  # Criação mal sucedida:
  #   @return { render json: @ticket.errors, status: :unprocessable_entity }
  def create    
    @ticket = Ticket.new(ticket_params)

    @ticket.user = current_user

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # Metodo atualiza solicitação
  # @param [Date] data_entrada
  # @param [Date] data_saida
  # Criação bem sucedida:
  #   @return { render :show, status: :ok, location: @ticket }
  # Criação mal sucedida:
  #   @return { render json: @ticket.errors, status: :unprocessable_entity }
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # Metodo destroi ticket
  # Criação bem sucedida:
  #   @return { head :no_content }
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:data_entrada, :data_saida)
    end
end
