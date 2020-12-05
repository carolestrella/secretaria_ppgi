class BudgetsController < ApplicationController  
  ##
  # GET /budgets
  #
  # GET /budgets.json
  #
  # @return [Array[Budget]] - Array contendo todos os budgets (orçamentos)
  #
  # Observação: o sistema mantém somente um budget cadastrado. Assim, quando um novo budget é inserido, o antigo é deletado.
  def index
    @budgets = Budget.all
  end

  ##
  # GET /budgets/new
  #
  # @return [Budget] - Uma instância vazia de budget.
  def new
    @budget = Budget.new
  end

  ##
  # POST /budgets
  #
  # POST /budgets.json
  #
  # O método cria um novo orçamento. Além disso, deleta todos orçamentos previamente existentes.
  #
  # @param [Float] value - Valor do orçamento
  #
  # Criação bem sucedida:
  #
  #   @return {status: 200, notice: 'Budget was successfully created'}
  #
  #   Efeitos colaterais: o registro é salvo na tabela 'budget', e o usuario é redirecionado para '/budgets
  #
  # Criação mal sucedida:
  #
  #   @return JSON {status: 422, errors: {...}}
  #
  #   Efeitos colaterais: o usuário é redirecionado para a rota '/budgets/new' e o erro retornado é exibido em tela.
  def create
    @budgets = Budget.all

    @budgets.each do |b|
      b.destroy
    end
    
    @budget = Budget.new(budget_params)

    respond_to do |format|
      if @budget.save
        format.html { redirect_to '/budgets', notice: 'Budget was successfully created.' }
        format.json { render :show, status: :created, location: @budget }
      else
        format.html { render :new }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    ##
    # Parâmetros recebidos pelo método.
    def budget_params
      params.require(:budget).permit(:value)
    end
end
