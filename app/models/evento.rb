class Evento < ApplicationRecord
    mount_uploaders :images, ImageUploader

    belongs_to :user
    
    validates :titulo, presence: true, length: { maximum: 100 }
    validates :descricao, presence: true, length: { maximum: 255 }
    validates :local, presence: true, length: { maximum: 100 }
    validates :data, presence: true
    validates :user_id, presence: true
end
