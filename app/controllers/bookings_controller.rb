class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  ##
  # Serve para buscar todas as diarias e envia as informações para a view
  # @return [@bookings] se existir
  def index
    @bookings = Booking.all
  end

  ##
  # Metodo serve apenas para view
  def show
  end

  ##
  # Metodo serve apenas para view
  def new
    @booking = Booking.new
  end

  ##
  # Metodo serve apenas para view
  def edit
  end

  ##
  # Metodo cria diarias
  # @param [Date] data_entrada
  # @param [Date] data_saida
  # Criação bem sucedida:
  #   @return { render :show, status: :created, location: @booking }
  # Criação mal sucedida:
  #   @return { render json: @booking.errors, status: :unprocessable_entity }
  def create
    @booking = Booking.new(booking_params)

    @booking.user = current_user

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # Metodo atualiza diarias
  # @param [Date] data_entrada
  # @param [Date] data_saida
  # Criação bem sucedida:
  #   @return { render :show, status: :ok, location: @booking }
  # Criação mal sucedida:
  #   @return { render json: @booking.errors, status: :unprocessable_entity }
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # Metodo destroi diarias
  # Criação bem sucedida:
  #   @return { head :no_content }
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:data_entrada, :data_saida)
    end
end
