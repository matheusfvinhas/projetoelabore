class Edital < ApplicationRecord
    validates :titulo, presence: true, length: { maximum: 100 }
    validates :descricao, presence: true, length: { maximum: 255 }
    validates :usuario_id, presence: true
end
