class ResidenciaController < ApplicationController
  before_action :set_residencium, only: [:show, :edit, :update, :destroy]

  # GET /residencia
  # GET /residencia.json
  def index
    @residencia = Residencium.all
  end

  # GET /residencia/1
  # GET /residencia/1.json
  def show
  end

  # GET /residencia/new
  def new
    @residencium = Residencium.new
  end

  # GET /residencia/1/edit
  def edit
  end

  # POST /residencia
  # POST /residencia.json
  def create
    @residencium = Residencium.new(residencium_params)

    respond_to do |format|
      if @residencium.save
        format.html { redirect_to @residencium, notice: 'Residencium was successfully created.' }
        format.json { render :show, status: :created, location: @residencium }
      else
        format.html { render :new }
        format.json { render json: @residencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /residencia/1
  # PATCH/PUT /residencia/1.json
  def update
    respond_to do |format|
      if @residencium.update(residencium_params)
        format.html { redirect_to @residencium, notice: 'Residencium was successfully updated.' }
        format.json { render :show, status: :ok, location: @residencium }
      else
        format.html { render :edit }
        format.json { render json: @residencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /residencia/1
  # DELETE /residencia/1.json
  def destroy
    @residencium.destroy
    respond_to do |format|
      format.html { redirect_to residencia_url, notice: 'Residencium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_residencium
      @residencium = Residencium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def residencium_params
      params.require(:residencium).permit(:telefones,, :nome, :endereco, :data_saida, :retorno_previsto, :ja_retornou, :data_retorno, :informacoes_complementares, :unidade_id, :programa_id)
    end
end
