require "application_system_test_case"

class BusquedasTest < ApplicationSystemTestCase
  setup do
    @busqueda = busquedas(:one)
  end

  test "visiting the index" do
    visit busquedas_url
    assert_selector "h1", text: "Busquedas"
  end

  test "should create busqueda" do
    visit busquedas_url
    click_on "New busqueda"

    fill_in "Categoria", with: @busqueda.categoria
    fill_in "Email", with: @busqueda.email
    fill_in "Texto", with: @busqueda.texto
    fill_in "Tipo", with: @busqueda.tipo
    click_on "Create Busqueda"

    assert_text "Busqueda was successfully created"
    click_on "Back"
  end

  test "should update Busqueda" do
    visit busqueda_url(@busqueda)
    click_on "Edit this busqueda", match: :first

    fill_in "Categoria", with: @busqueda.categoria
    fill_in "Email", with: @busqueda.email
    fill_in "Texto", with: @busqueda.texto
    fill_in "Tipo", with: @busqueda.tipo
    click_on "Update Busqueda"

    assert_text "Busqueda was successfully updated"
    click_on "Back"
  end

  test "should destroy Busqueda" do
    visit busqueda_url(@busqueda)
    click_on "Destroy this busqueda", match: :first

    assert_text "Busqueda was successfully destroyed"
  end
end
