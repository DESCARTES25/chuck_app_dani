class DropIndexInCategory < ActiveRecord::Migration[7.0]
  def change
    remove_index :categoria, :name, unique: true
  end
end
