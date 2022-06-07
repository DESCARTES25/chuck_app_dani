class Resultado < ApplicationRecord
    belongs_to :busqueda
    validates :url, presence: true
    validates :value, presence: true
end
