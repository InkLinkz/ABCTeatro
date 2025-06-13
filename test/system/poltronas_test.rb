require "application_system_test_case"

class PoltronasTest < ApplicationSystemTestCase
  setup do
    @poltrona = poltronas(:one)
  end

  test "visiting the index" do
    visit poltronas_url
    assert_selector "h1", text: "Poltronas"
  end

  test "should create poltrona" do
    visit poltronas_url
    click_on "New poltrona"

    fill_in "Area", with: @poltrona.area_id
    check "Disponivel" if @poltrona.disponivel
    fill_in "Numero", with: @poltrona.numero
    click_on "Create Poltrona"

    assert_text "Poltrona was successfully created"
    click_on "Back"
  end

  test "should update Poltrona" do
    visit poltrona_url(@poltrona)
    click_on "Edit this poltrona", match: :first

    fill_in "Area", with: @poltrona.area_id
    check "Disponivel" if @poltrona.disponivel
    fill_in "Numero", with: @poltrona.numero
    click_on "Update Poltrona"

    assert_text "Poltrona was successfully updated"
    click_on "Back"
  end

  test "should destroy Poltrona" do
    visit poltrona_url(@poltrona)
    click_on "Destroy this poltrona", match: :first

    assert_text "Poltrona was successfully destroyed"
  end
end
