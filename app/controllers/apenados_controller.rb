class ApenadosController < ApplicationController
  before_action :set_apenado, only: [:show, :edit, :update, :destroy]

  # GET /apenados
  # GET /apenados.json
  def index
    if current_user.admin?
      @apenados = Apenado.all.paginate(:page => params[:page])
    else
      @apenados = current_user.unidade.apenados.paginate(:page => params[:page])
    end
  end

  # GET /apenados/1
  # GET /apenados/1.json
  def show
  end

  # GET /apenados/new
  def new
    @apenado = Apenado.new
  end

  # GET /apenados/1/edit
  def edit
  end

  # GET /apenados/pauta
  def pauta
    @visitas = current_user.unidade.visits.where('data_visita >= ?', Date.today)  
  end

  # PUT /apenados/gerar_pauta
  def gerar_pauta
    data = params[:data_fim]
    data_fim = Date.new data["year"].to_i, data["month"].to_i, data["day"].to_i


    Visit.gerar_visitas(data_fim, current_user.unidade_id)
    redirect_to pauta_apenados_url
  end

  # POST /apenados
  # POST /apenados.json
  def create
    @apenado = Apenado.new(apenado_params)


    unless current_user.admin?
      @apenado.unidade_id = current_user.unidade_id
    end

    respond_to do |format|
      if @apenado.save
        format.html { redirect_to @apenado, notice: 'Apenado was successfully created.' }
        format.json { render :show, status: :created, location: @apenado }
      else
        format.html { render :new }
        format.json { render json: @apenado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apenados/1
  # PATCH/PUT /apenados/1.json
  def update
    respond_to do |format|
      if @apenado.update(apenado_params)
        format.html { redirect_to @apenado, notice: 'Apenado was successfully updated.' }
        format.json { render :show, status: :ok, location: @apenado }
      else
        format.html { render :edit }
        format.json { render json: @apenado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apenados/1
  # DELETE /apenados/1.json
  def destroy
    @apenado.destroy
    respond_to do |format|
      format.html { redirect_to apenados_url, notice: 'Apenado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apenado
      if current_user.admin?
        @apenado = Apenado.find(params[:id])
      else
        @apenado = current_user.unidade.apenados.find(params[:id])
      end
     
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apenado_params
      params.require(:apenado).permit(:unidade_id, :nome, :termino, :restricoes, :sexo, :nascimento, :mae, :documentos, :naturalidade, 
        :condenado_por, :endereco, :ativo, :motivo_inativo, :outras_informacoes, photos_attributes: [:id, :image, :_destroy])
    end
end
