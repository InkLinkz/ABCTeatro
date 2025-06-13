require "test_helper"

class PoltronasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @poltrona = poltronas(:one)
  end

  test "should get index" do
    get poltronas_url
    assert_response :success
  end

  test "should get new" do
    get new_poltrona_url
    assert_response :success
  end

  test "should create poltrona" do
    assert_difference("Poltrona.count") do
      post poltronas_url, params: { poltrona: { area_id: @poltrona.area_id, disponivel: @poltrona.disponivel, numero: @poltrona.numero } }
    end

    assert_redirected_to poltrona_url(Poltrona.last)
  end

  test "should show poltrona" do
    get poltrona_url(@poltrona)
    assert_response :success
  end

  test "should get edit" do
    get edit_poltrona_url(@poltrona)
    assert_response :success
  end

  test "should update poltrona" do
    patch poltrona_url(@poltrona), params: { poltrona: { area_id: @poltrona.area_id, disponivel: @poltrona.disponivel, numero: @poltrona.numero } }
    assert_redirected_to poltrona_url(@poltrona)
  end

  test "should destroy poltrona" do
    assert_difference("Poltrona.count", -1) do
      delete poltrona_url(@poltrona)
    end

    assert_redirected_to poltronas_url
  end
end
