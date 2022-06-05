class CreateBusquedas < ActiveRecord::Migration[7.0]
  def change
    create_table :busquedas do |t|
      t.string :tipo
      t.string :categoria
      t.string :texto
      t.string :email

      t.timestamps
    end
  end
end
