require "test_helper"

class AreasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @area = areas(:one)
  end

  test "should get index" do
    get areas_url
    assert_response :success
  end

  test "should get new" do
    get new_area_url
    assert_response :success
  end

  test "should create area" do
    assert_difference("Area.count") do
      post areas_url, params: { area: { nome: @area.nome, preco: @area.preco, quantidade_poltronas: @area.quantidade_poltronas } }
    end

    assert_redirected_to area_url(Area.last)
  end

  test "should show area" do
    get area_url(@area)
    assert_response :success
  end

  test "should get edit" do
    get edit_area_url(@area)
    assert_response :success
  end

  test "should update area" do
    patch area_url(@area), params: { area: { nome: @area.nome, preco: @area.preco, quantidade_poltronas: @area.quantidade_poltronas } }
    assert_redirected_to area_url(@area)
  end

  test "should destroy area" do
    assert_difference("Area.count", -1) do
      delete area_url(@area)
    end

    assert_redirected_to areas_url
  end
end
