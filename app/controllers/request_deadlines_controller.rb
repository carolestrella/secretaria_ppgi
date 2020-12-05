class RequestDeadlinesController < ApplicationController

  ##
  # Serve para buscar todas as deadlines e envia as informações para a view
  # @return [@request_deadlines] se existir
  def index
    @request_deadlines = RequestDeadline.all
  end

  ##
  # Metodo serve apenas para view
  def new
    @request_deadline = RequestDeadline.new
  end

  ##
  # Metodo cria DeadLines
  # @param [Date] deadline
  # Criação bem sucedida:
  #   @return { render :show, status: :created, location: @request_deadline }
  # Criação mal sucedida:
  #   @return { render json: @request_deadline.errors, status: :unprocessable_entity }
  def create
    @request_deadlines = RequestDeadline.all

    @request_deadlines.each do |r|
      r.destroy!
    end
    
    @request_deadline = RequestDeadline.new(request_deadline_params)

    respond_to do |format|
      if @request_deadline.save
        format.html { redirect_to '/request_deadlines', notice: 'O prazo para solitações foi definido com sucesso.' }
        format.json { render :show, status: :created, location: @request_deadline }
      else
        format.html { render :new }
        format.json { render json: @request_deadline.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def request_deadline_params
      params.require(:request_deadline).permit(:deadline)
    end
end
