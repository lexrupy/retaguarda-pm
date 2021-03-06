class ProgramasController < ApplicationController
  before_action :set_programa, only: [:show, :edit, :update, :destroy]

  # GET /programas
  # GET /programas.json
  def index
    if current_user.admin?
      @programas = Programa.all.paginate(:page => params[:page])
    else
      @programas = current_user.unidade.programas.paginate(:page => params[:page])
    end
    
  end

  # GET /programas/1
  # GET /programas/1.json
  def show
  end

  # GET /programas/new
  def new
    @programa = Programa.new
  end

  # GET /programas/1/edit
  def edit
  end

  # POST /programas
  # POST /programas.json
  def create
    @programa = Programa.new(programa_params)


    unless current_user.admin?
      @programa.unidade_id = current_user.unidade_id
    end

    respond_to do |format|
      if @programa.save
        format.html { redirect_to @programa, notice: 'Programa was successfully created.' }
        format.json { render :show, status: :created, location: @programa }
      else
        format.html { render :new }
        format.json { render json: @programa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /programas/1
  # PATCH/PUT /programas/1.json
  def update
    respond_to do |format|
      if @programa.update(programa_params)
        format.html { redirect_to @programa, notice: 'Programa was successfully updated.' }
        format.json { render :show, status: :ok, location: @programa }
      else
        format.html { render :edit }
        format.json { render json: @programa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programas/1
  # DELETE /programas/1.json
  def destroy
    @programa.destroy
    respond_to do |format|
      format.html { redirect_to programas_url, notice: 'Programa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_programa
      if current_user.admin?
        @programa = Programa.find(params[:id])
      else
        @programa = current_user.unidade.programas.find(params[:id])
      end
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def programa_params
      params.require(:programa).permit(:descricao, :data_inicio, :data_fim, :unidade_id)
    end
end
