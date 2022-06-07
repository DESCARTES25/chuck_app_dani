class AddIndexToCategoria < ActiveRecord::Migration[7.0]
  def change
    add_index :categoria, :name, unique: true
  end
end
