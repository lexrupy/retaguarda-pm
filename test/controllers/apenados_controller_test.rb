require 'test_helper'

class ApenadosControllerTest < ActionController::TestCase
  setup do
    @apenado = apenados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apenados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create apenado" do
    assert_difference('Apenado.count') do
      post :create, apenado: { ativo: @apenado.ativo, condenado_por: @apenado.condenado_por, documentos: @apenado.documentos, endereco: @apenado.endereco, mae: @apenado.mae, motivo_inativo: @apenado.motivo_inativo, nascimento: @apenado.nascimento, naturalidade: @apenado.naturalidade, nome: @apenado.nome, restricoes: @apenado.restricoes, sexo: @apenado.sexo, termino: @apenado.termino }
    end

    assert_redirected_to apenado_path(assigns(:apenado))
  end

  test "should show apenado" do
    get :show, id: @apenado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @apenado
    assert_response :success
  end

  test "should update apenado" do
    patch :update, id: @apenado, apenado: { ativo: @apenado.ativo, condenado_por: @apenado.condenado_por, documentos: @apenado.documentos, endereco: @apenado.endereco, mae: @apenado.mae, motivo_inativo: @apenado.motivo_inativo, nascimento: @apenado.nascimento, naturalidade: @apenado.naturalidade, nome: @apenado.nome, restricoes: @apenado.restricoes, sexo: @apenado.sexo, termino: @apenado.termino }
    assert_redirected_to apenado_path(assigns(:apenado))
  end

  test "should destroy apenado" do
    assert_difference('Apenado.count', -1) do
      delete :destroy, id: @apenado
    end

    assert_redirected_to apenados_path
  end
end
