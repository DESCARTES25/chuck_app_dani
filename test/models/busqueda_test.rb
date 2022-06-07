require "test_helper"

class BusquedaTest < ActiveSupport::TestCase
  test 'busqueda_random_valida' do
    busqueda = Busqueda.new(tipo: 'random' , email: 'escartin.daniel@gmail.com')
    assert busqueda.valid?
  end

  test 'busqueda_categoria_valida' do
    busqueda = Busqueda.new(tipo: 'category', categoria: 'animal' , email: 'escartin.daniel@gmail.com')
    assert busqueda.valid?
  end

  test 'busqueda_text_valida' do
    busqueda = Busqueda.new(tipo: 'text', texto: 'fast' , email: 'escartin.daniel@gmail.com')
    assert busqueda.valid?
  end

  test 'busqueda_correo_valido' do
    busqueda = Busqueda.new(tipo: 'text', texto: 'fast' , email: 'escartin.daniel@gmail.com')
    assert busqueda.valid?
  end

  test 'busqueda_correo_invalido' do
    busqueda = Busqueda.new(tipo: 'text', texto: 'fast' , email: 'escartin.danielgmail.com')
    assert (not busqueda.valid?)
  end

  test 'busqueda_correo_no_presente' do
    busqueda = Busqueda.new(tipo: 'text', texto: 'fast' , email: nil)
    assert (not busqueda.valid?)
  end

  test 'busqueda_tipo_busqueda_incorrecto' do
    busqueda = Busqueda.new(tipo: 'categorio',  categoria: 'animal' , email: 'escartin.daniel@gmail.com')
    assert (not busqueda.valid?)
  end

end
