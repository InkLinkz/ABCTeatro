require "application_system_test_case"

class SessoesTest < ApplicationSystemTestCase
  setup do
    @sessao = sessoes(:one)
  end

  test "visiting the index" do
    visit sessoes_url
    assert_selector "h1", text: "sessoes"
  end

  test "should create sessao" do
    visit sessoes_url
    click_on "New sessao"

    fill_in "Horario", with: @sessao.horario
    fill_in "Peca", with: @sessao.peca_id
    click_on "Create Sessao"

    assert_text "Sessao was successfully created"
    click_on "Back"
  end

  test "should update Sessao" do
    visit sessao_url(@sessao)
    click_on "Edit this sessao", match: :first

    fill_in "Horario", with: @sessao.horario
    fill_in "Peca", with: @sessao.peca_id
    click_on "Update Sessao"

    assert_text "Sessao was successfully updated"
    click_on "Back"
  end

  test "should destroy Sessao" do
    visit sessao_url(@sessao)
    click_on "Destroy this sessao", match: :first

    assert_text "Sessao was successfully destroyed"
  end
end
