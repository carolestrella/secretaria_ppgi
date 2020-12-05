class RequirementsController < ApplicationController
 
  
  ##
  # Serve para buscar todas as requisitos e envia as informações para a view
  # @return [@requirements] se existir
  def index
    @requirements = Requirement.all
  end

  ##
  # Server para a view e retornar todos os requisitos
  # @return [@all_requirements] se existir
  def new
    @all_requirements = Requirement.all

    puts "REQUIREMENTS", @requirements
    
    @requirement = Requirement.new
  end

  ##
  # Metodo cria requisitos
  # @param [string] requirements
  # Criação bem sucedida:
  #   @return { render :show, status: :created, location: @requirement }
  # Criação mal sucedida:
  #   @return { render json: @requirement.errors, status: :unprocessable_entity }
  def create
    requirements = Requirement.all
  
    @requirement = Requirement.new(requirement_params)

    respond_to do |format|
      if @requirement.save
        # Delete previous requirements. 
        requirements.each do |requirement|
          if requirement != @requirement
            requirement.destroy!
          end
        end

        format.html { redirect_to '/requirements', notice: 'Requisitos criados com sucesso' }
        format.json { render :show, status: :created, location: @requirement }
      else
        format.html { render :new }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def requirement_params
      params.require(:requirement).permit(:requirements)
    end
end
