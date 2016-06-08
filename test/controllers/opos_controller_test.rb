require 'test_helper'

class OposControllerTest < ActionController::TestCase
  setup do
    @opo = opos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:opos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create opo" do
    assert_difference('Opo.count') do
      post :create, opo: { data_fim: @opo.data_fim, data_inicio: @opo.data_inicio, descricao: @opo.descricao, numero: @opo.numero, texto: @opo.texto, unidade_id: @opo.unidade_id }
    end

    assert_redirected_to opo_path(assigns(:opo))
  end

  test "should show opo" do
    get :show, id: @opo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @opo
    assert_response :success
  end

  test "should update opo" do
    patch :update, id: @opo, opo: { data_fim: @opo.data_fim, data_inicio: @opo.data_inicio, descricao: @opo.descricao, numero: @opo.numero, texto: @opo.texto, unidade_id: @opo.unidade_id }
    assert_redirected_to opo_path(assigns(:opo))
  end

  test "should destroy opo" do
    assert_difference('Opo.count', -1) do
      delete :destroy, id: @opo
    end

    assert_redirected_to opos_path
  end
end
