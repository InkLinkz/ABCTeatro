require "application_system_test_case"

class EstatiscasTest < ApplicationSystemTestCase
  setup do
    @estatisca = estatiscas(:one)
  end

  test "visiting the index" do
    visit estatiscas_url
    assert_selector "h1", text: "Estatiscas"
  end

  test "should create estatisca" do
    visit estatiscas_url
    click_on "New estatisca"

    click_on "Create Estatisca"

    assert_text "Estatisca was successfully created"
    click_on "Back"
  end

  test "should update Estatisca" do
    visit estatisca_url(@estatisca)
    click_on "Edit this estatisca", match: :first

    click_on "Update Estatisca"

    assert_text "Estatisca was successfully updated"
    click_on "Back"
  end

  test "should destroy Estatisca" do
    visit estatisca_url(@estatisca)
    click_on "Destroy this estatisca", match: :first

    assert_text "Estatisca was successfully destroyed"
  end
end
