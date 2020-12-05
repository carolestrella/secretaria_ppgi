class BudgetsController < ApplicationController  
  ##
  # GET /budgets
  #
  # GET /budgets.json
  #
  # Returns a list containing all budgets in the system.
  #
  # However, it's important to notice that the system is designed to allow only 1 budget instance, 
  # as multiple budgets would lead to inconsistencies.
  def index
    @budgets = Budget.all
  end

  # GET /budgets/new
  def new
    @budget = Budget.new
  end

  # POST /budgets
  # POST /budgets.json
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
    # Use callbacks to share common setup or constraints between actions.
    def set_budget
      @budget = Budget.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def budget_params
      params.require(:budget).permit(:value)
    end
end
