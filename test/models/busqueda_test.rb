require "test_helper"

class BusquedaTest < ActiveSupport::TestCase
  test 'busqueda_random_valida' do
    busqueda = Busqueda.new(tipo: 'random' , email: 'escartin.daniel@gmail.com')
    assert busqueda.valid?
  end
end
