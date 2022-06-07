require "test_helper"

class ResultadoTest < ActiveSupport::TestCase
  test 'resultado_valido' do
    @busqueda = Busqueda.new(tipo: 'random' , email: 'escartin.daniel@gmail.com')
    @busqueda.save

    fake_url = "https://api.chucknorris.io/jokes/Vnx6otXNQD6W04saS5qZjA"

    fake_value = "When Chuck Norris gets fast food, his order is ready before he walks in."

    resultado = Resultado.new( url: fake_url, value: fake_value ,busqueda_id: @busqueda.id)
    assert resultado.valid?
  end

  test 'resultado_sin_busqueda_invalido' do
    fake_url = "https://api.chucknorris.io/jokes/Vnx6otXNQD6W04saS5qZjA"

    fake_value = "When Chuck Norris gets fast food, his order is ready before he walks in."

    resultado = Resultado.new( url: fake_url, value: fake_value ,busqueda_id: 0)
    assert (not resultado.valid?)
  end

  test 'resultado_sin_url_invalido' do
    @busqueda = Busqueda.new(tipo: 'random' , email: 'escartin.daniel@gmail.com')
    @busqueda.save

    fake_url = nil

    fake_value = "When Chuck Norris gets fast food, his order is ready before he walks in."

    resultado = Resultado.new( url: fake_url, value: fake_value ,busqueda_id: @busqueda.id)
    assert (not resultado.valid?)
  end

  test 'resultado_sin_value_invalido' do
    @busqueda = Busqueda.new(tipo: 'random' , email: 'escartin.daniel@gmail.com')
    @busqueda.save

    fake_url = "https://api.chucknorris.io/jokes/Vnx6otXNQD6W04saS5qZjA"

    fake_value = nil

    resultado = Resultado.new( url: fake_url, value: fake_value ,busqueda_id: @busqueda.id)
    assert (not resultado.valid?)
  end

  # test 'busqueda_correo_invalido' do
  #   busqueda = Busqueda.new(tipo: 'texto', texto: 'fast' , email: 'escartin.danielgmail.com')
  #   assert (not busqueda.valid?)
  # end

  # test 'busqueda_correo_no_presente' do
  #   busqueda = Busqueda.new(tipo: 'texto', texto: 'fast' , email: nil)
  #   assert (not busqueda.valid?)
  # end

  # test 'busqueda_tipo_busqueda_incorrecto' do
  #   busqueda = Busqueda.new(tipo: 'categorio',  categoria: 'animal' , email: 'escartin.daniel@gmail.com')
  #   assert (not busqueda.valid?)
  # end
end
