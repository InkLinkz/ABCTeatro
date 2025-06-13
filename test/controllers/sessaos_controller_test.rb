require "test_helper"

class SessoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sessao = sessoes(:one)
  end

  test "should get index" do
    get sessoes_url
    assert_response :success
  end

  test "should get new" do
    get new_sessao_url
    assert_response :success
  end

  test "should create sessao" do
    assert_difference("Sessao.count") do
      post sessoes_url, params: { sessao: { horario: @sessao.horario, peca_id: @sessao.peca_id } }
    end

    assert_redirected_to sessao_url(Sessao.last)
  end

  test "should show sessao" do
    get sessao_url(@sessao)
    assert_response :success
  end

  test "should get edit" do
    get edit_sessao_url(@sessao)
    assert_response :success
  end

  test "should update sessao" do
    patch sessao_url(@sessao), params: { sessao: { horario: @sessao.horario, peca_id: @sessao.peca_id } }
    assert_redirected_to sessao_url(@sessao)
  end

  test "should destroy sessao" do
    assert_difference("Sessao.count", -1) do
      delete sessao_url(@sessao)
    end

    assert_redirected_to sessoes_url
  end
end
