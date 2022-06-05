class ResultadosController < ApplicationController

  
  def index
    @resultados = Resultado.all
  end

 
  def show
  end


  def new
    @resultado = Resultado.new
  end


  def edit
  end

 
  def create

    @busqueda = Busqueda.find(params[:busqueda_id])
 
    @resultado = Resultado.new(resultado_params)

    if @resultado.save
        puts "Resultado was successfully created." 
    else
        puts "Resultado was not created." 
    end
    
  end

  private
    # Only allow a list of trusted parameters through.
    def resultado_params
      params.require(:resultado).permit(:url, :value)
    end

end
