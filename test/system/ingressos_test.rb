require "application_system_test_case"

class IngressosTest < ApplicationSystemTestCase
  setup do
    @ingresso = ingressos(:one)
  end

  test "visiting the index" do
    visit ingressos_url
    assert_selector "h1", text: "Ingressos"
  end

  test "should create ingresso" do
    visit ingressos_url
    click_on "New ingresso"

    fill_in "Poltrona", with: @ingresso.poltrona_id
    fill_in "Sessao", with: @ingresso.sessao_id
    fill_in "Usuario", with: @ingresso.usuario_id
    fill_in "Valor", with: @ingresso.valor
    click_on "Create Ingresso"

    assert_text "Ingresso was successfully created"
    click_on "Back"
  end

  test "should update Ingresso" do
    visit ingresso_url(@ingresso)
    click_on "Edit this ingresso", match: :first

    fill_in "Poltrona", with: @ingresso.poltrona_id
    fill_in "Sessao", with: @ingresso.sessao_id
    fill_in "Usuario", with: @ingresso.usuario_id
    fill_in "Valor", with: @ingresso.valor
    click_on "Update Ingresso"

    assert_text "Ingresso was successfully updated"
    click_on "Back"
  end

  test "should destroy Ingresso" do
    visit ingresso_url(@ingresso)
    click_on "Destroy this ingresso", match: :first

    assert_text "Ingresso was successfully destroyed"
  end
end
