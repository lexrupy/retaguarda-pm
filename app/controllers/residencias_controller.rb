class ResidenciasController < ApplicationController
  before_action :set_programa, except: [:show, :edit, :update, :destroy]
  before_action :set_residencia, only: [:show, :edit, :update, :destroy]

  # GET /residencia
  # GET /residencia.json
  def index
    @residencias = @programa.residencias.all.paginate(:page => params[:page])
  end

  # GET /residencia/1
  # GET /residencia/1.json
  def show
  end

  # GET /residencia/new
  def new
    @residencia = @programa.residencias.new
  end

  # GET /residencia/1/edit
  def edit
  end

  # POST /residencia
  # POST /residencia.json
  def create
    @residencia = @programa.residencias.new(residencia_params)

    respond_to do |format|
      if @residencia.save
        format.html { redirect_to [@programa, @residencia], notice: 'residencia was successfully created.' }
        format.json { render :show, status: :created, location:[@programa, @residencia] }
      else
        format.html { render :new }
        format.json { render json: @residencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /residencia/1
  # PATCH/PUT /residencia/1.json
  def update
    respond_to do |format|
      if @residencia.update(residencia_params)
        format.html { redirect_to [@programa, @residencia], notice: 'residencia was successfully updated.' }
        format.json { render :show, status: :ok, location: [@programa, @residencia] }
      else
        format.html { render :edit }
        format.json { render json: @residencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /residencia/1
  # DELETE /residencia/1.json
  def destroy
    @residencia.destroy
    respond_to do |format|
      format.html { redirect_to programa_residencia_url(@programa), notice: 'residencia was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_programa
      if current_user.admin?
        @programa = Programa.find(params[:programa_id])
      else
        @programa = current_user.unidade.programas.find(params[:programa_id])
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_residencia
      if current_user.admin?
        @programa = Programa.find(params[:programa_id])
      else
        @programa = current_user.unidade.programas.find(params[:programa_id])
      end
      @residencia = @programa.residencias.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def residencia_params
      params.require(:residencia).permit(:telefones, :nome, :endereco, :data_saida, :retorno_previsto, :ja_retornou, :data_retorno, :informacoes_complementares, :unidade_id, :programa_id)
    end
end
