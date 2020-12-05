class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  ##
  # Serve para buscar todas as requisições e envia as informações para a view
  # @return [@requests] se existir
  def index    
    @requests = Request.all
  end

  ##
  # Metodo serve apenas para view
  def show
  end

  ##
  # Metodo serve apenas para view
  def new
    @request = Request.new
  end

  ##
  # Metodo serve apenas para view
  def edit
  end

  ##
  # Metodo cria solicitações
  # @param [FK] request_type_id  
  # @param [FK] user_id
  # @param [string] documents
  # Criação bem sucedida:
  #   @return { render :show, status: :created, location: @request }
  # Criação mal sucedida:
  #   @return { render json: @request.errors, status: :unprocessable_entity }
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # Metodo atualiza solicitação
  # @param [string] title
  # Criação bem sucedida:
  #   @return { render :show, status: :ok, location: @request }
  # Criação mal sucedida:
  #   @return { render json: @request.errors, status: :unprocessable_entity }
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # Metodo destroi solicitação
  # Criação bem sucedida:
  #   @return { head :no_content }
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def request_params
      params.require(:request).permit(:request_type_id, :user_id, :documents)
    end
end
