class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    if current_user.admin?
      @users = User.all.paginate(:page => params[:page])
    else
      @users = User.where(unidade_id: current_user.unidade_id).paginate(:page => params[:page])
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    # Senha padrao = matricula
    @user.password = @user.matricula
    @user.password_confirmation = @user.matricula
    @user.admin = false

    # Usuario comum so pode criar usuarios em sua propria unidade
    unless current_user.admin?
      @user.unidade_id = current_user.unidade_id
    end

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Usuário criado com sucesso.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Usuário alterado com sucesso.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Usuário excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  def change_password
    @user_to_change = current_user
  end

  def do_change_password
    @user_to_change = current_user
    
    if @user_to_change.authenticate(params[:user][:old_password])
      pw1, pw2 =  params[:user][:password], params[:user][:password_confirmation]
      logger.debug(pw1)
      logger.debug(pw1)
      if pw1 == pw2
        @user_to_change.password = pw1
        @user_to_change.password_confirmation = pw2
        if @user_to_change.save
          redirect_to root_url, notice: "Senha alterada com sucesso!"
        else
          flash[:notice] = "Erro ao alterar a senha!"
          render :change_password
        end
      else
        flash[:notice] = "A nova senha e a confirmação não conferem!"
        render :change_password
      end
    else
      flash[:notice] = "Senha atual incorreta!"
      render :change_password
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:matricula, :nome, :unidade_id, :reset_pwd, :old_password, :password, :password_confirmation, :ativo)
    end
end
