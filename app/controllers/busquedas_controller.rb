
class BusquedasController < ApplicationController
  
  before_action :set_busqueda, only: %i[ show edit update destroy ]

  # GET /busquedas or /busquedas.json
  def index
    @busquedas = Busqueda.all
  end

  # GET /busquedas/1 or /busquedas/1.json
  def show
  end

  # GET /busquedas/new
  def new
    @busqueda = Busqueda.new
  end

  # GET /busquedas/1/edit
  def edit
  end

  # POST /busquedas or /busquedas.json
  def create
    @busqueda = Busqueda.new(busqueda_params)

    puts params[:busqueda][:tipo]

    puts params[:busqueda][:texto]

    puts params[:busqueda][:email]

    puts params[:busqueda][:categoria]

    #En funcion del tipo de de búsqueda invocamos a una clase u otra

    if params[:busqueda][:tipo] == "text" 
      chuck_search_text = ChuckTextSearch.new(params[:busqueda][:texto])
      json_reponse = chuck_search_text.query_text
    elsif params[:busqueda][:tipo] == "random"
      chuck_search_text = ChuckRandomSearch.new()
      json_reponse = chuck_search_text.random
    else 
      chuck_search_text = ChuckCategorySearch.new(params[:busqueda][:categoria])
      json_reponse = chuck_search_text.random_category
    end

    begin
      category_array = JSON.parse(json_reponse&.body, object_class: OpenStruct, array_class: Set)
    rescue JSON::ParserError, TypeError => e
        puts e
    end

    respond_to do |format|
      if @busqueda.save

        #Recorremos todos los resultados de la búsqueda y los vamos guardando en bd

        if params[:busqueda][:tipo] == "text" 
          
          #Varios resultados
          category_array.result.each do |item|
            puts item.id
            puts item.url
            puts item.value

            crear_resultado(item)

          end
        elsif params[:busqueda][:tipo] == "random"
            puts category_array.id
            puts category_array.url
            puts category_array.value
          crear_resultado(category_array)
        else 
            puts category_array.id
            puts category_array.url
            puts category_array.value
          crear_resultado(category_array)
        end


   
        #En caso de que el email del usuario venga informado y sea un email valido procedemos al envío del correo
        ChuckSearchMailer.welcome_email("inspiringbenchuck@gmail.com")
        

        format.html { redirect_to busqueda_url(@busqueda), notice: "Busqueda was successfully created." }
        format.json { render :show, status: :created, location: @busqueda }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @busqueda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /busquedas/1 or /busquedas/1.json
  def update
    respond_to do |format|
      if @busqueda.update(busqueda_params)
        format.html { redirect_to busqueda_url(@busqueda), notice: "Busqueda was successfully updated." }
        format.json { render :show, status: :ok, location: @busqueda }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @busqueda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /busquedas/1 or /busquedas/1.json
  def destroy
    @busqueda.destroy

    respond_to do |format|
      format.html { redirect_to busquedas_url, notice: "Busqueda was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_busqueda
      @busqueda = Busqueda.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def busqueda_params
      params.require(:busqueda).permit(:tipo, :categoria, :texto, :email)
    end

    def crear_resultado(item)

      @resultado = Resultado.new()

      @resultado.assign_attributes(
        url: item.url,
        value: item.value,
        busqueda_id: @busqueda.id
      )

      if @resultado.save
          puts "Resultado was successfully created." 
      else
          puts "Resultado was not created." 
      end

    end

     
end
