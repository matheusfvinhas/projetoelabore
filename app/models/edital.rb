class Edital < ApplicationRecord
    mount_uploader :document, DocumentUploader
    
    belongs_to :user

    validates :titulo, presence: true, length: { maximum: 100 }
    validates :descricao, presence: true, length: { maximum: 255 }
    validates :user_id, presence: true
end
