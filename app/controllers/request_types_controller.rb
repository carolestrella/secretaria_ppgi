class RequestTypesController < ApplicationController
  before_action :set_request_type, only: [:show, :edit, :update, :destroy]

<<<<<<< HEAD
  ##
  # Serve para buscar todas os tipo de requisição e envia as informações para a view
  # @return [@request_types] se existir
=======
  # GET /request_types
  # GET /request_types.json
>>>>>>> 7329d7928ac05f35e9973bc48a28ba2bbaade306
  def index
    @request_types = RequestType.all
  end

  ##
  # Metodo serve apenas para view
  def show
  end

  ##
  # Metodo serve apenas para view
  def new
    @request_type = RequestType.new
  end

  ##
  # Metodo serve apenas para view
  def edit
  end

  ##
  # Metodo cria tipo de solicitações
  # @param [string] title
  # Criação bem sucedida:
  #   @return { render :show, status: :created, location: @request_type }
  # Criação mal sucedida:
  #   @return { render json: @request_type.errors, status: :unprocessable_entity }
  def create
    @request_type = RequestType.new(request_type_params)

    respond_to do |format|
      if @request_type.save
        format.html { redirect_to @request_type, notice: 'Request type was successfully created.' }
        format.json { render :show, status: :created, location: @request_type }
      else
        format.html { render :new }
        format.json { render json: @request_type.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # Metodo atualiza tipo de solicitação
  # @param [string] title
  # Criação bem sucedida:
  #   @return { render :show, status: :ok, location: @request_type }
  # Criação mal sucedida:
  #   @return { render json: @request_type.errors, status: :unprocessable_entity }
  def update
    respond_to do |format|
      if @request_type.update(request_type_params)
        format.html { redirect_to @request_type, notice: 'Request type was successfully updated.' }
        format.json { render :show, status: :ok, location: @request_type }
      else
        format.html { render :edit }
        format.json { render json: @request_type.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # Metodo destroi Tipo de solicitação
  # Criação bem sucedida:
  #   @return { head :no_content }
  def destroy
    @request_type.destroy
    respond_to do |format|
      format.html { redirect_to request_types_url, notice: 'Request type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_type
      @request_type = RequestType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def request_type_params
      params.require(:request_type).permit(:title)
    end
end
