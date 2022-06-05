class CreateResultados < ActiveRecord::Migration[7.0]
  def change
    create_table :resultados do |t|
      t.string :url
      t.text :value
      t.references :busqueda, null: false, foreign_key: true

      t.timestamps
    end
  end
end
