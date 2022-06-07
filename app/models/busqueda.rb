class Busqueda < ApplicationRecord

    has_many :resultados, dependent: :destroy

    validates :tipo, presence: true
    
    validates_inclusion_of :tipo, :in => ['random','category','text']

    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } , presence:true

end
