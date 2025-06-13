require "test_helper"

class EstatiscasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estatisca = estatiscas(:one)
  end

  test "should get index" do
    get estatiscas_url
    assert_response :success
  end

  test "should get new" do
    get new_estatisca_url
    assert_response :success
  end

  test "should create estatisca" do
    assert_difference("Estatisca.count") do
      post estatiscas_url, params: { estatisca: {} }
    end

    assert_redirected_to estatisca_url(Estatisca.last)
  end

  test "should show estatisca" do
    get estatisca_url(@estatisca)
    assert_response :success
  end

  test "should get edit" do
    get edit_estatisca_url(@estatisca)
    assert_response :success
  end

  test "should update estatisca" do
    patch estatisca_url(@estatisca), params: { estatisca: {} }
    assert_redirected_to estatisca_url(@estatisca)
  end

  test "should destroy estatisca" do
    assert_difference("Estatisca.count", -1) do
      delete estatisca_url(@estatisca)
    end

    assert_redirected_to estatiscas_url
  end
end
