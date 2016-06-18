class OposController < ApplicationController
  before_action :set_opo, only: [:show, :edit, :update, :destroy]

  # GET /opos
  # GET /opos.json
  def index
    if current_user.admin?
      if params[:unidade_id] 
        @opos = Opo.where(unidade_id: params[:unidade_id])
      else
        @opos = Opo.all
      end
    else
      @opos = current_user.unidade.oops
    end
  end

  # GET /opos/1
  # GET /opos/1.json
  def show
  end

  # GET /opos/new
  def new
    @opo = Opo.new
  end

  # GET /opos/1/edit
  def edit
  end

  # POST /opos
  # POST /opos.json
  def create
    @opo = Opo.new(opo_params)


    unless current_user.admin?
      @opo.unidade_id = current_user.unidade_id
    end


    respond_to do |format|
      if @opo.save
        format.html { redirect_to @opo, notice: 'Opo was successfully created.' }
        format.json { render :show, status: :created, location: @opo }
      else
        format.html { render :new }
        format.json { render json: @opo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opos/1
  # PATCH/PUT /opos/1.json
  def update
    respond_to do |format|
      if @opo.update(opo_params)
        format.html { redirect_to @opo, notice: 'Opo was successfully updated.' }
        format.json { render :show, status: :ok, location: @opo }
      else
        format.html { render :edit }
        format.json { render json: @opo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opos/1
  # DELETE /opos/1.json
  def destroy
    @opo.destroy
    respond_to do |format|
      format.html { redirect_to opos_url, notice: 'Opo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opo
      @opo = Opo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def opo_params
      params.require(:opo).permit(:unidade_id, :numero, :descricao, :data_inicio, :data_fim, :texto)
    end
end
