class SetoresController < ApplicationController
  # POST /create_setor
  def create
    @setor = current_user.unidade.setores.find_or_create_by(nome: params[:nome])
    render json: {id: @setor.id, nome: @setor.nome}, status: :ok
  end
end