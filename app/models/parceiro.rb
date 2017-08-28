class Parceiro < ApplicationRecord
    validates :email, presence: true
    validates :nome, presence: true, length: { maximum: 50 }
    validates :sobre, presence: true, length: { maximum: 5000}
end
