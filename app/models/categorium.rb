class Categorium < ApplicationRecord
    validates :name, uniqueness: true
end
