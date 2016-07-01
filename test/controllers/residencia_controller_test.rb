require 'test_helper'

class ResidenciaControllerTest < ActionController::TestCase
  setup do
    @residencium = residencia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:residencia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create residencium" do
    assert_difference('Residencium.count') do
      post :create, residencium: { data_retorno: @residencium.data_retorno, data_saida: @residencium.data_saida, endereco: @residencium.endereco, informacoes_complementares: @residencium.informacoes_complementares, ja_retornou: @residencium.ja_retornou, nome: @residencium.nome, programa_id: @residencium.programa_id, retorno_previsto: @residencium.retorno_previsto, telefones,: @residencium.telefones,, unidade_id: @residencium.unidade_id }
    end

    assert_redirected_to residencium_path(assigns(:residencium))
  end

  test "should show residencium" do
    get :show, id: @residencium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @residencium
    assert_response :success
  end

  test "should update residencium" do
    patch :update, id: @residencium, residencium: { data_retorno: @residencium.data_retorno, data_saida: @residencium.data_saida, endereco: @residencium.endereco, informacoes_complementares: @residencium.informacoes_complementares, ja_retornou: @residencium.ja_retornou, nome: @residencium.nome, programa_id: @residencium.programa_id, retorno_previsto: @residencium.retorno_previsto, telefones,: @residencium.telefones,, unidade_id: @residencium.unidade_id }
    assert_redirected_to residencium_path(assigns(:residencium))
  end

  test "should destroy residencium" do
    assert_difference('Residencium.count', -1) do
      delete :destroy, id: @residencium
    end

    assert_redirected_to residencia_path
  end
end
