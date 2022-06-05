class Busqueda < ApplicationRecord

    has_many :resultados, dependent: :destroy

    validates :tipo, presence: true
    


end
